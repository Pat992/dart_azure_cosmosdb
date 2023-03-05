// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:dart_azure_cosmosdb/src/core/auth_util.dart';
import 'package:dart_azure_cosmosdb/src/domain/repositories/i_collection_repository.dart';
import 'package:dart_azure_cosmosdb/src/domain/repositories/i_database_repository.dart';
import 'package:dart_azure_cosmosdb/src/domain/repositories/i_document_repository.dart';
import 'package:dart_azure_cosmosdb/src/domain/repositories/i_permission_repository.dart';
import 'package:dart_azure_cosmosdb/src/domain/repositories/i_stored_procedure_repository.dart';
import 'package:dart_azure_cosmosdb/src/domain/repositories/i_trigger_repository.dart';
import 'package:dart_azure_cosmosdb/src/domain/repositories/i_user_defined_function_repository.dart';
import 'package:dart_azure_cosmosdb/src/domain/repositories/i_user_repository.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/collection_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/database_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/document_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_collection_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_database_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_document_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_permission_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_stored_procedures_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_trigger_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_user_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_user_defined_function_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/permission_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/stored_procedure_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/trigger_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/user_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/user_defined_function_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/repositories/collection_repository.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/repositories/database_repository.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/repositories/document_repository.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/repositories/permission_repository.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/repositories/stored_procedure_repository.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/repositories/trigger_repository.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/repositories/user_defined_function_repository.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/repositories/user_repository.dart';
import 'package:http/http.dart' as http;

class CosmosDb {
  final String authorizationType;
  final String authorizationVersion;
  final String connectionUri;
  final String xmsVersion;
  final String primaryKey;
  late final ICollectionDatasource _collectionDatasource;
  late final IDatabaseDatasource _databaseDatasource;
  late final IDocumentDatasource _documentDatasource;
  late final IPermissionDatasource _permissionDatasource;
  late final IStoredProcedureDatasource _storedProcedureDatasource;
  late final ITriggerDatasource _triggerDatasource;
  late final IUserDatasource _userDatasource;
  late final IUserDefinedFunctionDatasource _userDefinedFunctionDatasource;
  final _client = http.Client();
  final IAuthUtil _authUtil = AuthUtil();
  late final ICollectionRepository collection;
  late final IDatabaseRepository database;
  late final IDocumentRepository document;
  late final IPermissionRepository permission;
  late final IStoredProcedureRepository storedProcedure;
  late final ITriggerRepository trigger;
  late final IUserRepository user;
  late final IUserDefinedFunctionRepository userDefinedFunctions;

  CosmosDb({
    required this.connectionUri,
    required this.primaryKey,
    this.authorizationType = 'master',
    this.authorizationVersion = '1.0',
    this.xmsVersion = '2018-12-31',
  }) {
    _collectionDatasource = CollectionDatasource(
      client: _client,
      connectionUri: connectionUri,
      primaryKey: primaryKey,
      authorizationType: authorizationType,
      authorizationVersion: authorizationVersion,
      xmsVersion: xmsVersion,
      authUtil: _authUtil,
    );

    _databaseDatasource = DatabaseDatasource(
      client: _client,
      connectionUri: connectionUri,
      primaryKey: primaryKey,
      authorizationType: authorizationType,
      authorizationVersion: authorizationVersion,
      xmsVersion: xmsVersion,
      authUtil: _authUtil,
    );

    _documentDatasource = DocumentDatasource(
      client: _client,
      connectionUri: connectionUri,
      primaryKey: primaryKey,
      authorizationType: authorizationType,
      authorizationVersion: authorizationVersion,
      xmsVersion: xmsVersion,
      authUtil: _authUtil,
    );

    _permissionDatasource = PermissionDatasource(
      client: _client,
      connectionUri: connectionUri,
      primaryKey: primaryKey,
      authorizationType: authorizationType,
      authorizationVersion: authorizationVersion,
      xmsVersion: xmsVersion,
      authUtil: _authUtil,
    );

    _triggerDatasource = TriggerDatasource(
      client: _client,
      connectionUri: connectionUri,
      primaryKey: primaryKey,
      authorizationType: authorizationType,
      authorizationVersion: authorizationVersion,
      xmsVersion: xmsVersion,
      authUtil: _authUtil,
    );

    _storedProcedureDatasource = StoredProcedureDatasource(
      client: _client,
      connectionUri: connectionUri,
      primaryKey: primaryKey,
      authorizationType: authorizationType,
      authorizationVersion: authorizationVersion,
      xmsVersion: xmsVersion,
      authUtil: _authUtil,
    );

    _userDatasource = UserDatasource(
      client: _client,
      connectionUri: connectionUri,
      primaryKey: primaryKey,
      authorizationType: authorizationType,
      authorizationVersion: authorizationVersion,
      xmsVersion: xmsVersion,
      authUtil: _authUtil,
    );

    _userDefinedFunctionDatasource = UserDefinedFunctionDatasource(
      client: _client,
      connectionUri: connectionUri,
      primaryKey: primaryKey,
      authorizationType: authorizationType,
      authorizationVersion: authorizationVersion,
      xmsVersion: xmsVersion,
      authUtil: _authUtil,
    );

    collection =
        CollectionRepository(collectionDatasource: _collectionDatasource);
    database = DatabaseRepository(databaseDatasource: _databaseDatasource);
    document = DocumentRepository(documentDatasource: _documentDatasource);
    permission =
        PermissionRepository(permissionDatasource: _permissionDatasource);
    storedProcedure = StoredProcedureRepository(
        storedProcedureDatasource: _storedProcedureDatasource);
    trigger = TriggerRepository(triggerDatasource: _triggerDatasource);
    user = UserRepository(userDatasource: _userDatasource);
    userDefinedFunctions = UserDefinedFunctionRepository(
        userDefinedFunctionDatasource: _userDefinedFunctionDatasource);
  }
}
