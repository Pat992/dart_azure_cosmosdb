// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/core/auth_util.dart';
import 'package:dart_azure_cosmosdb/src/domain/repositories/i_repository_barrel.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/datasources_barrel.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/repositories/repository_barrel.dart';
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
