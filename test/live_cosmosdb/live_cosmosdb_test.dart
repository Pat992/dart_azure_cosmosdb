import 'dart:convert';
import 'dart:io';

import 'package:dart_azure_cosmosdb/dart_azure_cosmosdb.dart';
import 'package:test/test.dart';

import '../fixtures/fixture_reader.dart';

// TODO: document execution of stored proc, queries for documents (also test) etc
// TODO: update document creation/replace (id)

void main() {
  late CosmosDb cosmosDb;
  String execEnv = Platform.environment['EXEC_ENV'] ?? '';
  String cosmosUrl = Platform.environment['URL'] ?? '';
  String key = Platform.environment['KEY'] ?? '';

  // cosmos-connection.json
  setUp(() {
    if (execEnv != 'github_actions') {
      final cosmosDBSettings = json.decode(fixture('cosmos-connection.json'));
      cosmosUrl = cosmosDBSettings['URL'];
      key = cosmosDBSettings['KEY'];
    }
    cosmosDb = CosmosDb(connectionUri: cosmosUrl, primaryKey: key);
  });
  // -------------------------------------------------------------------------------------------------------------------------------
  // Databases
  // -------------------------------------------------------------------------------------------------------------------------------
  group('Databases', () {
    test('List databases', () async {
      // arrange
      // act
      final res = await cosmosDb.database.list();
      // assert
      expect(res.count, 1);
      expect(res.error, {});
      expect(res.databases.length, 1);
    });

    test('Get database', () async {
      // arrange
      // act
      final res = await cosmosDb.database.get(dbId: 'test-db');
      // assert
      expect(res.id, 'test-db');
      expect(res.error, {});
    });

    test('Create database', () async {
      // arrange
      // act
      final res = await cosmosDb.database.create(dbId: 'new-db');
      final list = await cosmosDb.database.list();
      // assert
      expect(res.id, 'new-db');
      expect(list.count, 2);
      expect(res.error, {});
    });

    test('Delete database', () async {
      // arrange
      // act
      final res = await cosmosDb.database.delete(dbId: 'new-db');
      final list = await cosmosDb.database.list();
      // assert
      expect(res.id, 'new-db');
      expect(list.count, 1);
      expect(res.error, {});
    });
  });

  // -------------------------------------------------------------------------------------------------------------------------------
  // Collections
  // -------------------------------------------------------------------------------------------------------------------------------
  group('Collections', () {
    test('List collections', () async {
      // arrange
      // act
      final res = await cosmosDb.collection.list(dbId: 'test-db');
      // assert
      expect(res.count, 1);
      expect(res.error, {});
      expect(res.collections.length, 1);
    });

    test('Get collection', () async {
      // arrange
      // act
      final res = await cosmosDb.collection
          .get(dbId: 'test-db', collectionId: 'test-container');
      // assert
      expect(res.id, 'test-container');
      expect(res.error, {});
    });

    test('Create collection', () async {
      // arrange
      // act
      final res = await cosmosDb.collection.create(
        dbId: 'test-db',
        collectionId: 'new-collection',
        version: 1,
        partitionKey: '/id',
      );
      final list = await cosmosDb.collection.list(dbId: 'test-db');
      // assert
      expect(res.id, 'new-collection');
      expect(list.count, 2);
      expect(res.error, {});
    });

    test('Delete collection', () async {
      // arrange
      // act
      final res = await cosmosDb.collection
          .delete(dbId: 'test-db', collectionId: 'new-collection');
      final list = await cosmosDb.collection.list(dbId: 'test-db');
      // assert
      expect(res.id, 'new-collection');
      expect(list.count, 1);
      expect(res.error, {});
    });
  });

  // -------------------------------------------------------------------------------------------------------------------------------
  // Documents
  // -------------------------------------------------------------------------------------------------------------------------------
  group('Documents', () {
    test('List documents', () async {
      // arrange
      // act
      final res = await cosmosDb.document
          .list(dbId: 'test-db', collectionId: 'test-container');
      // assert
      expect(res.count, 1);
      expect(res.error, {});
      expect(res.documents.length, 1);
    });

    test('Get document', () async {
      // arrange
      // act
      final res = await cosmosDb.document.get(
        dbId: 'test-db',
        collectionId: 'test-container',
        documentId: 'id1',
        partitionKey: 'id1',
      );
      // assert
      expect(res.id, 'id1');
      expect(res.values['name'], 'jane');
      expect(res.values['familyName'], 'doe');
      expect(res.values['age'], 35);
      expect(res.error, {});
    });

    test('Create document', () async {
      // arrange
      // act
      final res = await cosmosDb.document.create(
        dbId: 'test-db',
        collectionId: 'test-container',
        body: {
          "id": "id2",
          "name": "new name",
          "familyName": "new family name",
          "age": 25,
        },
        partitionKey: 'id2',
      );
      final list = await cosmosDb.document.list(
        dbId: 'test-db',
        collectionId: 'test-container',
      );
      // assert
      expect(res.id, 'id2');
      expect(res.values['name'], 'new name');
      expect(res.values['familyName'], 'new family name');
      expect(res.values['age'], 25);
      expect(list.count, 2);
      expect(res.error, {});
    });

    test('Replace document', () async {
      // arrange
      // act
      final res = await cosmosDb.document.replace(
        dbId: 'test-db',
        collectionId: 'test-container',
        body: {
          "id": "id2",
          "name": "updated name",
          "familyName": "updated family name",
          "age": 15,
        },
        partitionKey: 'id2',
        documentId: 'id2',
      );

      final list = await cosmosDb.document.list(
        dbId: 'test-db',
        collectionId: 'test-container',
      );
      // assert
      expect(res.id, 'id2');
      expect(res.values['name'], 'updated name');
      expect(res.values['familyName'], 'updated family name');
      expect(res.values['age'], 15);
      expect(list.count, 2);
      expect(res.error, {});
    });

    test('Delete document', () async {
      // arrange
      // act
      final res = await cosmosDb.document.delete(
        dbId: 'test-db',
        collectionId: 'test-container',
        documentId: 'id2',
        partitionKey: 'id2',
      );

      final list = await cosmosDb.document.list(
        dbId: 'test-db',
        collectionId: 'test-container',
      );
      // assert
      expect(res.id, 'id2');
      expect(list.count, 1);
      expect(res.error, {});
    });
  });

  // -------------------------------------------------------------------------------------------------------------------------------
  // Stored procedures
  // -------------------------------------------------------------------------------------------------------------------------------
  group('Stored procedures', () {
    test('List stored procedures', () async {
      // arrange
      // act
      final res = await cosmosDb.storedProcedure
          .list(dbId: 'test-db', collectionId: 'test-container');
      // assert
      expect(res.count, 1);
      expect(res.error, {});
      expect(res.storedProcedures.length, 1);
    });

    test('Execute stored procedure', () async {
      // arrange
      // act
      final res = await cosmosDb.storedProcedure.execute(
        dbId: 'test-db',
        collectionId: 'test-container',
        storedProcedureId: 'my-stproc',
        parameters: ['Hello StProc'],
      );
      // assert
      expect(res, '"Hello StProc"');
    });

    test('Create stored procedure', () async {
      // arrange
      // act
      final res = await cosmosDb.storedProcedure.create(
        dbId: 'test-db',
        collectionId: 'test-container',
        storedProcedureId: 'created-stproc',
        function: 'function createdFunc(param) {}',
      );

      final list = await cosmosDb.storedProcedure.list(
        dbId: 'test-db',
        collectionId: 'test-container',
      );
      // assert
      expect(res.id, 'created-stproc');
      expect(res.body, 'function createdFunc(param) {}');
      expect(list.count, 2);
      expect(res.error, {});
    });

    test('Replace stored procedure', () async {
      // arrange
      // act
      final res = await cosmosDb.storedProcedure.replace(
        dbId: 'test-db',
        collectionId: 'test-container',
        storedProcedureId: 'created-stproc',
        function: 'function updatedFunc(param) {var context = getContext();}',
      );

      final list = await cosmosDb.storedProcedure.list(
        dbId: 'test-db',
        collectionId: 'test-container',
      );
      // assert
      expect(res.id, 'created-stproc');
      expect(res.body,
          'function updatedFunc(param) {var context = getContext();}');
      expect(list.count, 2);
      expect(res.error, {});
    });

    test('Delete stored procedure', () async {
      // arrange
      // act
      final res = await cosmosDb.storedProcedure.delete(
        dbId: 'test-db',
        collectionId: 'test-container',
        storedProcedureId: 'created-stproc',
      );

      final list = await cosmosDb.storedProcedure.list(
        dbId: 'test-db',
        collectionId: 'test-container',
      );
      // assert
      expect(res.id, 'created-stproc');
      expect(list.count, 1);
      expect(res.error, {});
    });
  });

  // -------------------------------------------------------------------------------------------------------------------------------
  // User defined functions
  // -------------------------------------------------------------------------------------------------------------------------------
  group('User defined functions', () {
    test('List user defined functions', () async {
      // arrange
      // act
      final res = await cosmosDb.userDefinedFunctions
          .list(dbId: 'test-db', collectionId: 'test-container');
      // assert
      expect(res.count, 1);
      expect(res.error, {});
      expect(res.userDefinedFunctions[0].id, 'my-udf');
      expect(res.userDefinedFunctions.length, 1);
    });

    test('Create user defined function', () async {
      // arrange
      // act
      final res = await cosmosDb.userDefinedFunctions.create(
        dbId: 'test-db',
        collectionId: 'test-container',
        userDefinedFunctionId: 'created-udf',
        function: 'function createdFunc(param) {}',
      );

      final list = await cosmosDb.userDefinedFunctions.list(
        dbId: 'test-db',
        collectionId: 'test-container',
      );
      // assert
      expect(res.id, 'created-udf');
      expect(res.body, 'function createdFunc(param) {}');
      expect(list.count, 2);
      expect(res.error, {});
    });

    test('Replace user defined function', () async {
      // arrange
      // act
      final res = await cosmosDb.userDefinedFunctions.replace(
        dbId: 'test-db',
        collectionId: 'test-container',
        userDefinedFunctionId: 'created-udf',
        function: 'function updatedFunc(param) {var context = getContext();}',
      );

      final list = await cosmosDb.userDefinedFunctions.list(
        dbId: 'test-db',
        collectionId: 'test-container',
      );
      // assert
      expect(res.id, 'created-udf');
      expect(res.body,
          'function updatedFunc(param) {var context = getContext();}');
      expect(list.count, 2);
      expect(res.error, {});
    });

    test('Delete user defined function', () async {
      // arrange
      // act
      final res = await cosmosDb.userDefinedFunctions.delete(
        dbId: 'test-db',
        collectionId: 'test-container',
        userDefinedFunctionId: 'created-udf',
      );

      final list = await cosmosDb.userDefinedFunctions.list(
        dbId: 'test-db',
        collectionId: 'test-container',
      );
      // assert
      expect(res.id, 'created-udf');
      expect(list.count, 1);
      expect(res.error, {});
    });
  });

  // -------------------------------------------------------------------------------------------------------------------------------
  // Triggers
  // -------------------------------------------------------------------------------------------------------------------------------
  group('Triggers', () {
    test('List triggers', () async {
      // arrange
      // act
      final res = await cosmosDb.trigger
          .list(dbId: 'test-db', collectionId: 'test-container');
      // assert
      expect(res.count, 1);
      expect(res.error, {});
      expect(res.triggers[0].id, 'my-trigger');
      expect(res.triggers[0].triggerOperation, TriggerOperation.all);
      expect(res.triggers[0].triggerType, TriggerType.pre);
      expect(res.triggers.length, 1);
    });

    test('Create trigger', () async {
      // arrange
      // act
      final res = await cosmosDb.trigger.create(
        dbId: 'test-db',
        collectionId: 'test-container',
        triggerId: 'created-trigger',
        triggerType: TriggerType.post,
        triggerOperation: TriggerOperation.replace,
        function: 'function createdFunc(param) {}',
      );

      final list = await cosmosDb.trigger.list(
        dbId: 'test-db',
        collectionId: 'test-container',
      );
      // assert
      expect(res.id, 'created-trigger');
      expect(res.triggerOperation, TriggerOperation.replace);
      expect(res.triggerType, TriggerType.post);
      expect(res.body, 'function createdFunc(param) {}');
      expect(list.count, 2);
      expect(res.error, {});
    });

    test('Replace trigger', () async {
      // arrange
      // act
      final res = await cosmosDb.trigger.replace(
        dbId: 'test-db',
        collectionId: 'test-container',
        triggerId: 'created-trigger',
        triggerType: TriggerType.pre,
        triggerOperation: TriggerOperation.delete,
        function: 'function updatedFunc(param) {var context = getContext();}',
      );

      final list = await cosmosDb.trigger.list(
        dbId: 'test-db',
        collectionId: 'test-container',
      );
      // assert
      expect(res.id, 'created-trigger');
      expect(res.triggerOperation, TriggerOperation.delete);
      expect(res.triggerType, TriggerType.pre);
      expect(res.body,
          'function updatedFunc(param) {var context = getContext();}');
      expect(list.count, 2);
      expect(res.error, {});
    });

    test('Delete trigger', () async {
      // arrange
      // act
      final res = await cosmosDb.trigger.delete(
        dbId: 'test-db',
        collectionId: 'test-container',
        triggerId: 'created-trigger',
      );

      final list = await cosmosDb.trigger.list(
        dbId: 'test-db',
        collectionId: 'test-container',
      );
      // assert
      expect(res.id, 'created-trigger');
      expect(list.count, 1);
      expect(res.error, {});
    });
  });

  // -------------------------------------------------------------------------------------------------------------------------------
  // Users
  // -------------------------------------------------------------------------------------------------------------------------------
  group('Users', () {
    test('List Users', () async {
      // arrange
      // act
      final res = await cosmosDb.user.list(dbId: 'test-db');
      // assert
      expect(res.count, 2);
      expect(res.error, {});
      expect(res.users[0].id, 'my-user');
      expect(res.users.length, 2);
    });

    test('Get user', () async {
      // arrange
      // act
      final res = await cosmosDb.user.get(
        dbId: 'test-db',
        userId: 'my-user',
      );

      // assert
      expect(res.id, 'my-user');
      expect(res.permissions, 'permissions/');
      expect(res.error, {});
    });

    test('Create user', () async {
      // arrange
      // act
      final res = await cosmosDb.user.create(
        dbId: 'test-db',
        userId: 'created-user',
      );

      final list = await cosmosDb.user.list(dbId: 'test-db');
      // assert
      expect(res.id, 'created-user');
      expect(res.permissions, 'permissions/');
      expect(list.count, 3);
      expect(res.error, {});
    });

    test('Replace user', () async {
      // arrange
      // act
      final res = await cosmosDb.user.replace(
        dbId: 'test-db',
        userId: 'created-user',
        newUserId: 'updated-user',
      );

      final list = await cosmosDb.user.list(dbId: 'test-db');
      // assert
      expect(res.id, 'updated-user');
      expect(res.permissions, 'permissions/');
      expect(list.count, 3);
      expect(res.error, {});
    });

    test('Delete user', () async {
      // arrange
      // act
      final res = await cosmosDb.user.delete(
        dbId: 'test-db',
        userId: 'updated-user',
      );

      final list = await cosmosDb.user.list(dbId: 'test-db');
      // assert
      expect(res.id, 'updated-user');
      expect(list.count, 2);
      expect(res.error, {});
    });
  });

  // -------------------------------------------------------------------------------------------------------------------------------
  // Permissions
  // -------------------------------------------------------------------------------------------------------------------------------
  group('Permissions', () {
    test('List Permissions', () async {
      // arrange
      // act
      final res = await cosmosDb.permission.list(
        dbId: 'test-db',
        userId: 'my-user',
      );
      // assert
      expect(res.count, 1);
      expect(res.error, {});
      expect(res.permissions[0].id, 'my-permission');
      expect(res.permissions.length, 1);
    });

    test('Get Permission', () async {
      // arrange
      // act
      final res = await cosmosDb.permission.get(
        dbId: 'test-db',
        userId: 'my-user',
        permissionId: 'my-permission',
      );

      // assert
      expect(res.id, 'my-permission');
      expect(res.permissionMode, PermissionMode.all);
      expect(res.error, {});
    });

    test('Create Permission', () async {
      // arrange
      // act
      final res = await cosmosDb.permission.create(
        dbId: 'test-db',
        userId: 'perm-user',
        permissionId: 'created-permission',
        collectionId: 'test-container',
        permissionMode: PermissionMode.read,
      );

      final list = await cosmosDb.permission.list(
        dbId: 'test-db',
        userId: 'perm-user',
      );

      // assert
      expect(res.id, 'created-permission');
      expect(res.permissionMode, PermissionMode.read);
      expect(list.count, 1);
      expect(res.error, {});
    });

    test('Replace Permission', () async {
      // arrange
      // act
      final res = await cosmosDb.permission.replace(
        dbId: 'test-db',
        userId: 'perm-user',
        permissionId: 'created-permission',
        newPermissionId: 'updated-permission',
        collectionId: 'test-container',
        permissionMode: PermissionMode.all,
      );

      final list = await cosmosDb.permission.list(
        dbId: 'test-db',
        userId: 'perm-user',
      );

      // assert
      expect(res.id, 'updated-permission');
      expect(res.permissionMode, PermissionMode.all);
      expect(list.count, 1);
      expect(res.error, {});
    });

    test('Delete Permission', () async {
      // arrange
      // act
      final res = await cosmosDb.permission.delete(
        dbId: 'test-db',
        userId: 'perm-user',
        permissionId: 'updated-permission',
      );

      final list = await cosmosDb.permission.list(
        dbId: 'test-db',
        userId: 'perm-user',
      );
      // assert
      expect(res.id, 'updated-permission');
      expect(list.count, 0);
      expect(res.error, {});
    });
  });
}
