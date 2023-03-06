import 'package:dart_azure_cosmosdb/dart_azure_cosmosdb.dart';

Future<void> main() async {
  final cosmosDb = CosmosDb(
    // REQUIRED -> URI to the Azure Cosmos Database.
    connectionUri: 'https://<COSMOS_DB_NAME>.documents.azure.com:443/',
    // REQUIRED -> Primary key to the Cosmos Database.
    primaryKey: '<COSMOS_DB_KEY>',
    // OPTIONAL -> Authorization type of the provided token.
    // Default: master
    authorizationType: 'master',
    // OPTIONAL -> Version of the provided authorization.
    // Default: 1.0
    authorizationVersion: '1.0',
    // OPTIONAL -> The supported REST API versions of the Azure Cosmos DB service.
    // Default: 2018-12-31
    xmsVersion: '2018-12-31',
  );

  final CosmosDatabaseList databaseList = await cosmosDb.database.list();

  if (databaseList.error.isEmpty) {
    // If the errors are empty, continue....
  }

  // final CosmosDatabase database = await cosmosDb.database.get(dbId: '<DB_ID>');
  //
  // if (database.error.isEmpty) {
  //   // If the errors are empty, continue....
  // }

  final CosmosDatabase database =
      await cosmosDb.database.delete(dbId: '<DB_ID>');

  if (database.error.isEmpty) {
    // If the errors are empty, continue....
  }

  final CollectionList collectionList =
      await cosmosDb.collection.list(dbId: '<DB_ID>');

  if (collectionList.error.isEmpty) {
    // If the error is empty, continue....
  }

  // final Collection collection = await cosmosDb.collection
  //     .get(dbId: '<DB_ID>', collectionId: '<COLLECTION_ID>');
  //
  // if (collection.error.isEmpty) {
  //   // If the error is empty, continue....
  // }

  // final Collection collection = await cosmosDb.collection.create(
  //   dbId: '<DB_ID>',
  //   collectionId: '<COLLECTION_ID>',
  //   partitionKey: '/id',
  //   version: 1,
  // );
  //
  // if (collection.error.isEmpty) {
  //   // If the error is empty, continue....
  // }

  final Collection collection = await cosmosDb.collection
      .delete(dbId: '<DB_ID>', collectionId: '<COLLECTION_ID>');

  if (collection.error.isEmpty) {
    // If the error is empty, continue....
  }

  final CosmosDocumentList documentList = await cosmosDb.document
      .list(dbId: '<DB_ID>', collectionId: '<COLLECTION_ID>');

  if (documentList.error.isEmpty) {
    // If the error is empty, continue....
  }

  // final CosmosDocument document = await cosmosDb.document.get(
  //   dbId: '<DB_ID>',
  //   collectionId: '<COLLECTION_ID>',
  //   documentId: '<DOCUMENT_ID>',
  //   partitionKey: '<DOCUMENT_PARTITION_KEY>',
  // );
  //
  // if (document.error.isEmpty) {
  //   // If the error is empty, continue....
  // }

  // final Person person = Person(
  //     name: 'Jane', familyName: 'Doe', birthDate: '01.01.1970');
  //
  // final CosmosDocument document = await cosmosDb.document.create(
  //   dbId: '<DB_ID>',
  //   collectionId: '<COLLECTION_ID>',
  //   partitionKey: '<DOCUMENT_PARTITION_KEY>',
  //   body: person.toMap(),
  // );
  //
  // if (document.error.isEmpty) {
  //   // If the error is empty, continue....
  // }

  // final Person personUpdated =
  //     Person(name: 'Jane', familyName: 'Doe', birthDate: '01.01.1970');
  //
  // final CosmosDocument document = await cosmosDb.document.replace(
  //   dbId: '<DB_ID>',
  //   collectionId: '<COLLECTION_ID>',
  //   partitionKey: '<DOCUMENT_PARTITION_KEY>',
  //   documentId: '01',
  //   body: person.toMap(),
  // );
  //
  // if (document.error.isEmpty) {
  //   // If the error is empty, continue....
  // }

  final CosmosDocument document = await cosmosDb.document.delete(
    dbId: '<DB_ID>',
    collectionId: '<COLLECTION_ID>',
    partitionKey: '<DOCUMENT_PARTITION_KEY>',
    documentId: '01',
  );

  if (document.error.isEmpty) {
    // If the error is empty, continue....
  }

  final StoredProcedureList storedProcedureList = await cosmosDb.storedProcedure
      .list(dbId: '<DB_ID>', collectionId: '<COLLECTION_ID>');

  if (storedProcedureList.error.isEmpty) {
    // If the error is empty, continue....
  }

  // final StoredProcedure storedProcedure = await cosmosDb.storedProcedure.create(
  //   dbId: '<DB_ID>',
  //   collectionId: '<COLLECTION_ID>',
  //   storedProcedureId: '<SPROC_ID>',
  //   function:
  //       'function (docToCreate, addedPropertyName, addedPropertyValue { getContext().getResponse().setBody(\'Hello World\'); }',
  // );
  //
  // if (storedProcedure.error.isEmpty) {
  //   // If the error is empty, continue....
  // }

  // final StoredProcedure storedProcedure =
  //     await cosmosDb.storedProcedure.replace(
  //   dbId: '<DB_ID>',
  //   collectionId: '<COLLECTION_ID>',
  //   storedProcedureId: '<SPROC_ID>',
  //   function:
  //       'function (docToCreate, addedPropertyName, addedPropertyValue { getContext().getResponse().setBody(\'Hello World\'); }',
  // );
  //
  // if (storedProcedure.error.isEmpty) {
  //   // If the error is empty, continue....
  // }

  final StoredProcedure storedProcedure = await cosmosDb.storedProcedure.delete(
    dbId: '<DB_ID>',
    collectionId: '<COLLECTION_ID>',
    storedProcedureId: '<SPROC_ID>',
  );

  if (storedProcedure.error.isEmpty) {
    // If the error is empty, continue....
  }

  final UserDefinedFunctionList userDefinedFunctionList =
      await cosmosDb.userDefinedFunctions.list(
    dbId: '<DB_ID>',
    collectionId: '<COLLECTION_ID>',
  );

  if (userDefinedFunctionList.error.isEmpty) {
    // If the error is empty, continue....
  }

  // final UserDefinedFunction userDefinedFunction =
  //     await cosmosDb.userDefinedFunctions.create(
  //   dbId: '<DB_ID>',
  //   collectionId: '<COLLECTION_ID>',
  //   userDefinedFunctionId: '<UDFS_ID>',
  //   function: 'function updateMetadata() { ... }',
  // );
  //
  // if (userDefinedFunction.error.isEmpty) {
  //   // If the error is empty, continue....
  // }

  // final UserDefinedFunction userDefinedFunction =
  //     await cosmosDb.userDefinedFunctions.replace(
  //   dbId: '<DB_ID>',
  //   collectionId: '<COLLECTION_ID>',
  //   userDefinedFunctionId: '<UDFS_ID>',
  //   function: 'function updateMetadata() { ... }',
  // );
  //
  // if (userDefinedFunction.error.isEmpty) {
  //   // If the error is empty, continue....
  // }

  final UserDefinedFunction userDefinedFunction =
      await cosmosDb.userDefinedFunctions.delete(
    dbId: '<DB_ID>',
    collectionId: '<COLLECTION_ID>',
    userDefinedFunctionId: '<UDFS_ID>',
  );

  if (userDefinedFunction.error.isEmpty) {
    // If the error is empty, continue....
  }

  final TriggerList triggerList = await cosmosDb.trigger.list(
    dbId: '<DB_ID>',
    collectionId: '<COLLECTION_ID>',
  );

  if (triggerList.error.isEmpty) {
    // If the error is empty, continue....
  }

  // final Trigger trigger = await cosmosDb.trigger.create(
  //   dbId: '<DB_ID>',
  //   collectionId: '<COLLECTION_ID>',
  //   triggerId: '<TRIGGER_ID>',
  //   function: 'function updateMetadata() { ... }',
  //   triggerOperation: TriggerOperation.all,
  //   triggerType: TriggerType.post,
  // );
  //
  // if (trigger.error.isEmpty) {
  //   // If the error is empty, continue....
  // }

  // final Trigger trigger = await cosmosDb.trigger.replace(
  //   dbId: '<DB_ID>',
  //   collectionId: '<COLLECTION_ID>',
  //   triggerId: '<TRIGGER_ID>',
  //   function: 'function updateMetadata() { ... }',
  //   triggerOperation: TriggerOperation.all,
  //   triggerType: TriggerType.post,
  // );
  //
  // if (trigger.error.isEmpty) {
  //   // If the error is empty, continue....
  // }

  final Trigger trigger = await cosmosDb.trigger.delete(
    dbId: '<DB_ID>',
    collectionId: '<COLLECTION_ID>',
    triggerId: '<TRIGGER_ID>',
  );

  if (trigger.error.isEmpty) {
    // If the error is empty, continue....
  }

  final UserList userList = await cosmosDb.user.list(dbId: '<DB_ID>');

  if (userList.error.isEmpty) {
    // If the error is empty, continue....
  }

  // final User user = await cosmosDb.user.get(
  //   dbId: '<DB_ID>',
  //   userId: '<USER_ID>',
  // );
  //
  // if (user.error.isEmpty) {
  //   // If the error is empty, continue....
  // }

  // final User user = await cosmosDb.user.create(
  //   dbId: '<DB_ID>',
  //   userId: '<USER_ID>',
  // );
  //
  // if (user.error.isEmpty) {
  //   // If the error is empty, continue....
  // }

  // final User user = await cosmosDb.user.replace(
  //   dbId: '<DB_ID>',
  //   userId: '<USER_ID>',
  //   newUserId: '<NEW_USER_ID>',
  // );
  //
  // if (user.error.isEmpty) {
  //   // If the error is empty, continue....
  // }

  final User user = await cosmosDb.user.delete(
    dbId: '<DB_ID>',
    userId: '<USER_ID>',
  );

  if (user.error.isEmpty) {
    // If the error is empty, continue....
  }

  final PermissionList permissionList = await cosmosDb.permission.list(
    dbId: '<DB_ID>',
    userId: '<USER_ID>',
  );

  if (permissionList.error.isEmpty) {
    // If the error is empty, continue....
  }

  // final Permission permission = await cosmosDb.permission.get(
  //   dbId: '<DB_ID>',
  //   userId: '<USER_ID>',
  //   permissionId: '<PERMISSION_ID>',
  // );
  //
  // if (permission.error.isEmpty) {
  //   // If the error is empty, continue....
  // }

  // final Permission permission = await cosmosDb.permission.create(
  //   dbId: '<DB_ID>',
  //   userId: '<USER_ID>',
  //   collectionId: '<COLLECTION_ID>',
  //   permissionId: '<PERMISSION_ID>',
  //   permissionMode: PermissionMode.all,
  // );
  //
  // if (permission.error.isEmpty) {
  //   // If the error is empty, continue....
  // }

  // final Permission permission = await cosmosDb.permission.replace(
  //   dbId: '<DB_ID>',
  //   userId: '<USER_ID>',
  //   collectionId: '<COLLECTION_ID>',
  //   permissionId: '<PERMISSION_ID>',
  //   newPermissionId: '<NEW_PERMISSION_ID>',
  //   permissionMode: PermissionMode.all,
  // );
  //
  // if (permission.error.isEmpty) {
  //   // If the error is empty, continue....
  // }

  final Permission permission = await cosmosDb.permission.delete(
    dbId: '<DB_ID>',
    userId: '<USER_ID>',
    permissionId: '<PERMISSION_ID>',
  );

  if (permission.error.isEmpty) {
    // If the error is empty, continue....
  }
}
