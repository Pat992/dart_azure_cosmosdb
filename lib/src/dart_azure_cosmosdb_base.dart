// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/core/auth_util.dart';
import 'package:dart_azure_cosmosdb/src/core/date_util.dart';
import 'package:dart_azure_cosmosdb/src/domain/repositories/i_repository_barrel.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/datasources_barrel.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/repositories/repository_barrel.dart';
import 'package:http/http.dart' as http;

class CosmosDb {
  /// **Description:** Authorization type of the provided token.
  ///
  /// **Default value:** 'master'
  final String authorizationType;

  /// **Description:** Version of the provided authorization.
  ///
  /// **Default value:** '1.0'
  final String authorizationVersion;

  /// **Description:** Base URI to the Azure Cosmos Database.
  ///
  /// **Example:** 'https://<COSMOS_DB_NAME>.documents.azure.com:443/'
  final String connectionUri;

  /// **Description:** The supported REST API versions of the Azure Cosmos DB service.
  ///
  /// **Default value:** '2018-12-31'
  final String xmsVersion;

  /// **Description:** Primary key to the Cosmos Database.
  final String primaryKey;

  /// **Description:** The collection-datasource, used by the collection-repository.
  late final ICollectionDatasource _collectionDatasource;

  /// **Description:** The database-datasource, used by the database-repository.
  late final IDatabaseDatasource _databaseDatasource;

  /// **Description:** The document-datasource, used by the document-repository.
  late final IDocumentDatasource _documentDatasource;

  /// **Description:** The permission-datasource, used by the permission-repository.
  late final IPermissionDatasource _permissionDatasource;

  /// **Description:** The stored-procedure-datasource, used by the stored-procedure-repository.
  late final IStoredProcedureDatasource _storedProcedureDatasource;

  /// **Description:** The trigger-datasource, used by the trigger-repository.
  late final ITriggerDatasource _triggerDatasource;

  /// **Description:** The user-datasource, used by the user-repository.
  late final IUserDatasource _userDatasource;

  /// **Description:** The user-defined-function-datasource, used by the user-defined-function-repository.
  late final IUserDefinedFunctionDatasource _userDefinedFunctionDatasource;

  /// **Description:** The http-client used in the datasources
  final _client = http.Client();

  /// **Description:** The auth-util, used for creating the http-headers.
  final IAuthUtil _authUtil = AuthUtil();

  /// **Description:** The date-util, used for creating and building the current date for the http-headers.
  final IDateUtil _dateUtil = DateUtil();

  /// **Description:** The REST API supports basic CRUD operations on the resources under a database account.
  /// A collection is a container of JSON documents and associated JavaScript application logic, i.e. stored procedures, triggers and user-defined functions.
  /// This topic outlines the REST operations used to manage document collections.
  late final ICollectionRepository collection;

  /// **Description:** A database is a logical namespace for collections, users, and permissions.
  late final IDatabaseRepository database;

  /// **Description:** The document resource is represented by docs in the Azure Cosmos DB resource model.
  /// A document consists of user-defined content in JSON format.
  /// Aside from the required ID property, users can define any arbitrary elements, structures, and hierarchies for the content.
  /// The ID element is a unique string that is user-settable and must not exceed 255 characters. You can insert, replace, delete, read, enumerate, and query arbitrary JSON documents in a collection.
  late final IDocumentRepository document;

  /// **Description:** A permission is an authorization token associated with a user for authorized access to a specific resource.
  /// It is used to manage access to collections, documents, attachments, stored procedures, triggers, and user-defined functions for a particular user.
  late final IPermissionRepository permission;

  /// **Description:** A stored procedure is a piece of application logic written in JavaScript that is registered and executed against a collection as a single transaction.
  /// In Azure Cosmos DB, JavaScript is hosted in the same memory space as the database.
  /// Hence, requests made within stored procedures execute in the same scope of a database session.
  /// This process enables Azure Cosmos DB to guarantee ACID for all operations that are part of a single stored procedure.
  late final IStoredProcedureRepository storedProcedure;

  /// **Description:** Triggers are pieces of application logic that can be executed before (pre-triggers) and after (post-triggers) creation, deletion, and replacement of a document.
  /// Triggers are written in JavaScript.
  /// Both pre and post triggers do no take parameters.
  /// Like stored procedures, triggers live within the confines of a collection, thus confining the application logic to the collection.
  late final ITriggerRepository trigger;

  /// **Description:** A user is a logical namespace for scoping permissions on collections, documents, attachment, stored procedures, triggers, and user-defined functions.
  /// The user construct lives under a database resource and thus cannot cross the database boundary it is under.
  /// The user resource is represented by users in the Azure Cosmos DB REST resource model.
  /// It is a system resource, and thus contains a fixed schema.
  late final IUserRepository user;

  /// **Description:** A user-defined function (UDF) is a side effect free piece of application logic written in JavaScript.
  /// It allows developers to construct a query operator, thus extending the core of the Cosmos DB query language.
  /// Like stored procedures, UDFs live in the confines of a collection, thus confining the application logic to the collection.
  late final IUserDefinedFunctionRepository userDefinedFunctions;

  /// **Description:** Creates a [CosmosDb] instance.
  ///
  /// **connectionUri:** The URI to the Azure Cosmos Database,
  /// for example: https://<COSMOS_DB_NAME>.documents.azure.com:443/
  ///
  /// [Type:] String *required*
  ///
  /// **primaryKey:** Primary key to the Cosmos Database.
  ///
  /// [Type:] String *required*
  ///
  /// **authorizationType:** Authorization type of the provided token.
  ///
  /// [Type:] String *optional*
  ///
  /// [Default value:] 'master'
  ///
  /// **authorizationVersion:** Version of the provided authorization.
  ///
  /// [Type:] String *optional*
  ///
  /// [Default value:] '1.0'
  ///
  /// **xmsVersion:** The supported REST API versions of the Azure Cosmos DB service.
  ///
  /// [Type:] String *optional*
  ///
  /// [Default value:] '2018-12-31'
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
      dateUtil: _dateUtil,
    );

    _databaseDatasource = DatabaseDatasource(
      client: _client,
      connectionUri: connectionUri,
      primaryKey: primaryKey,
      authorizationType: authorizationType,
      authorizationVersion: authorizationVersion,
      xmsVersion: xmsVersion,
      authUtil: _authUtil,
      dateUtil: _dateUtil,
    );

    _documentDatasource = DocumentDatasource(
      client: _client,
      connectionUri: connectionUri,
      primaryKey: primaryKey,
      authorizationType: authorizationType,
      authorizationVersion: authorizationVersion,
      xmsVersion: xmsVersion,
      authUtil: _authUtil,
      dateUtil: _dateUtil,
    );

    _permissionDatasource = PermissionDatasource(
      client: _client,
      connectionUri: connectionUri,
      primaryKey: primaryKey,
      authorizationType: authorizationType,
      authorizationVersion: authorizationVersion,
      xmsVersion: xmsVersion,
      authUtil: _authUtil,
      dateUtil: _dateUtil,
    );

    _triggerDatasource = TriggerDatasource(
      client: _client,
      connectionUri: connectionUri,
      primaryKey: primaryKey,
      authorizationType: authorizationType,
      authorizationVersion: authorizationVersion,
      xmsVersion: xmsVersion,
      authUtil: _authUtil,
      dateUtil: _dateUtil,
    );

    _storedProcedureDatasource = StoredProcedureDatasource(
      client: _client,
      connectionUri: connectionUri,
      primaryKey: primaryKey,
      authorizationType: authorizationType,
      authorizationVersion: authorizationVersion,
      xmsVersion: xmsVersion,
      authUtil: _authUtil,
      dateUtil: _dateUtil,
    );

    _userDatasource = UserDatasource(
      client: _client,
      connectionUri: connectionUri,
      primaryKey: primaryKey,
      authorizationType: authorizationType,
      authorizationVersion: authorizationVersion,
      xmsVersion: xmsVersion,
      authUtil: _authUtil,
      dateUtil: _dateUtil,
    );

    _userDefinedFunctionDatasource = UserDefinedFunctionDatasource(
      client: _client,
      connectionUri: connectionUri,
      primaryKey: primaryKey,
      authorizationType: authorizationType,
      authorizationVersion: authorizationVersion,
      xmsVersion: xmsVersion,
      authUtil: _authUtil,
      dateUtil: _dateUtil,
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
