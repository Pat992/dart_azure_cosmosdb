# Dart package for the Azure Cosmos Database

<div>
<a href="https://pub.dev/packages/dart_azure_cosmos_db"><img src="https://img.shields.io/pub/v/dart_azure_cosmos_db.svg" alt="Pub"></a>
<img alt="GitHub Workflow Status (branch)" src="https://shields.mitmproxy.org/github/workflow/status/Pat992/dart_azure_cosmos_db/Dart%20Tests/main">
<a href="https://github.com/Pat992/dart_azure_cosmos_db"><img src="https://img.shields.io/github/stars/Pat992/dart_azure_cosmos_db?style=flat&logo=github&colorB=deeppink&label=stars" alt="Star on Github"></a>
<a href="https://opensource.org/licenses/BSD-3-Clause"><img src="https://img.shields.io/static/v1?label=license&message=BSD 3-Clause&color=blue" alt="License: BSD 3-Clause"></a>
</div>

## Table of content

- [1 Features](#1-features)
- [2 Getting started](#2-getting-started)
  - [2.1 Android settings](#21-android-settings)
  - [2.2 iOS settings](#21-ios-settings)
  - [2.3 macOS settings](#23-macos-settings)
  - [2.4 Windows settings](#24-windows-settings)
  - [2.5 Linux settings](#25-linux-settings)
- [3 Usage](#3-usage)
  - [3.1 CosmosDB instance creation and configuration](#31-cosmosdb-instance-creation-and-configuration)
  - [3.2 Databases](#32-databases)
    - [3.2.1 List Databases](#321-list-databases)
    - [3.2.2 Get a Database](#321-get-a-database)
    - [3.2.3 Create a Database](#322-create-a-database)
    - [3.2.4 Delete a Database](#323-delete-a-database)
    - [3.2.5 The Database model](#325-the-database-model)
  - [3.3 Collections](#53-collections)
    - [3.3.1 List Collections](#331-list-collections)
    - [3.3.2 Get a Collection](#332-get-a-collection)
    - [3.3.3 Create a Collection](#333-create-a-collection)
    - [3.3.4 Delete a Collection](#335-delete-a-collection)
    - [3.3.5 The Collection model](#336-the-collection-model)
  - [3.4 Documents](#34-documents)
    - [3.4.1 List Documents](#341-list-documents)
    - [3.4.2 Get a Document](#342-get-a-document)
    - [3.4.3 Create a Document](#343-create-a-document)
    - [3.4.4 Replace a Document](#344-replace-a-document)
    - [3.4.5 Delete a Document](#345-delete-a-document)
    - [3.4.6 The Document model](#346-the-document-model)
  - [3.5 Stored Procedures](#35-stored-procedures)
    - [3.5.1 List Stored Procedures](#351-list-stored-procedures)
    - [3.5.2 Create a Stored Procedure](#352-create-a-stored-procedure)
    - [3.5.3 Replace a Stored Procedure](#353-replace-a-stored-procedure)
    - [3.5.4 Delete a Stored Procedure](#354-delete-a-stored-procedure)
    - [3.5.6 The Stored Procedure model](#356-the-stored-procedure-model)
  - [3.6 User Defined Functions](#36-user-defined-functions)
    - [3.6.1 List User Defined Functions](#361-list-user-defined-functions)
    - [3.6.2 Create a User Defined Function](#362-create-a-user-defined-function)
    - [3.6.3 Replace a User Defined Function](#363-replace-a-user-defined-function)
    - [3.6.4 Delete a User Defined Function](#364-delete-a-user-defined-function)
    - [3.6.5 The User Defined Function model](#365-the-user-defined-function-model)
  - [3.7 Triggers](#37-triggers)
    - [3.7.1 List Triggers](#371-list-triggers)
    - [3.7.2 Create a Trigger](#372-create-a-trigger)
    - [3.7.3 Replace a Trigger](#373-replace-a-trigger)
    - [3.7.4 Delete a Trigger](#374-delete-a-trigger)
    - [3.7.5 The Trigger model](#375-the-trigger-model)
  - [3.8 Users](#38-users)
    - [3.8.1 List Users](#381-list-users)
    - [3.8.2 Get a User](#382-get-a-user)
    - [3.8.3 Create a User](#383-create-a-user)
    - [3.8.4 Replace a User](#384-replace-a-user)
    - [3.8.5 Delete a User](#385-delete-a-user)
    - [3.8.6 The Trigger model](#386-the-trigger-model)
  - [3.9 Permissions](#39-permissions)
    - [3.9.1 List Permissions](#391-list-permissions)
    - [3.9.2 Get a Permission](#392-get-a-permission)
    - [3.9.3 Create a Permission](#393-create-a-permission)
    - [3.9.4 Replace a Permission](#394-replace-a-permission)
    - [3.9.5 Delete a Permission](#395-delete-a-permission)
    - [3.9.6 The Permission model](#396-the-permission-model)
- [4 Where to go from here](#4-where-to-go-from-here)
- [5 Bugs and issues](#5-bugs-and-issues)

## 1 Features
**dart_azure_cosmosdb** offers interaction with the Azure CosmosDB SQL-API.
For more information, check out the **[Microsoft CosmosDB documentation](https://learn.microsoft.com/en-us/rest/api/cosmos-db/)**.
## 2 Getting started

### 2.1 Android settings
This package uses the HTTP-package and needs access to the internet, networking needs to be enabled in the `.entitlements`.
```xml
<key>com.apple.security.network.client</key>
<true/>
```

### 2.2 iOS settings
No steps are necessary for iOS.

### 2.3 macOS settings
This package uses the HTTP-package and needs access to the internet, networking needs to be enabled in the `AndroidManifest.xml`.
```xml
<manifest xmlns:android...>
  ...
  <uses-permission android:name="android.permission.INTERNET" />
  <application ...
</manifest>
```

### 2.4 Windows settings
No steps are necessary for Windows.

### 2.5 Linux settings
No steps are necessary for Linux.

## 3 Usage

### 3.1 CosmosDB instance creation and configuration
First, you need to create an instance of the CosmosDB-class, as follows:
```dart
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
```

### 3.2 Databases
Each Azure Cosmos DB account supports multiple independently named databases. A database is a logical namespace for collections, users, and permissions.

#### 3.2.1 List Databases
The database-list operation returns a `Future<CosmosDatabaseList>` with a list of  `CosmosDatabase` or an error object.
```dart
final CosmosDatabaseList databaseList = await cosmosDb.database.list();

if(databaseList.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.2.2 Get a Database
The database-get operation returns a `Future<CosmosDatabase>`.
```dart
final CosmosDatabase database = await cosmosDb.database.get(dbId: '<DB_ID>');

if (database.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.2.3 Create a Database
The database-create operation returns a `Future<CosmosDatabase>`.
```dart
final CosmosDatabase database = await cosmosDb.database.create(dbId: '<DB_ID>');

if (database.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.2.4 Delete a Database
The database-delete operation returns a `Future<CosmosDatabase>`.
```dart
final CosmosDatabase database = await cosmosDb.database.delete(dbId: '<DB_ID>');

if (database.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.2.5 The Database model

### 3.3 Collections
A collection is a container of JSON documents and associated JavaScript application logic, i.e. stored procedures, triggers and user-defined functions.

#### 3.3.1 List Collections
The collection-list operation returns a `Future<CollectionList>` with a list of  `Collection` or an error object.
```dart
final CollectionList collectionList = await cosmosDb.collection
    .list(dbId: '<DB_ID>');

if (collectionList.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.3.2 Get a Collection
The collection-get operation returns a `Future<Collection>`.
```dart
final Collection collection = await cosmosDb.collection
    .get(dbId: '<DB_ID>', collectionId: '<COLLECTION_ID>');

if (collection.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.3.3 Create a Collection
The collection-create operation returns a `Future<Collection>`.
```dart
final Collection collection = await cosmosDb.collection.create(
    dbId: '<DB_ID>',
    collectionId: '<COLLECTION_ID>',
    partitionKey: '/id',
    version: 1,
);

if (collection.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.3.4 Delete a Collection
The collection-delete operation returns a `Future<Collection>`.
```dart
final Collection collection = await cosmosDb.collection
    .delete(dbId: '<DB_ID>', collectionId: '<COLLECTION_ID>');

if (collection.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.3.5 The Collection model

### 3.4 Documents
A document consists of user-defined content in JSON format. Aside from the required ID property, users can define any arbitrary elements, structures, and hierarchies for the content. The ID element is a unique string that is user-settable and must not exceed 255 characters. You can insert, replace, delete, read, enumerate, and query arbitrary JSON documents in a collection.

#### 3.4.1 List Documents
The document-list operation returns a `Future<CosmosDocumentList>` with a list of  `CosmosDocument` or an error object.
```dart
final CosmosDocumentList documentList = await cosmosDb.document
    .list(dbId: '<DB_ID>', collectionId: '<COLLECTION_ID>');

if (documentList.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.4.2 Get a Document
The collection-get operation returns a `Future<CosmosDocument>`.
```dart
final CosmosDocument document = await cosmosDb.document.get(
    dbId: '<DB_ID>',
    collectionId: '<COLLECTION_ID>',
    documentId: '<DOCUMENT_ID>',
    partitionKey: '<DOCUMENT_PARTITION_KEY>',
);

if (document.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.4.3 Create a Document
The collection-create operation returns a `Future<CosmosDocument>`.
```dart
final Person person = Person(
    id: '01',
    name: 'Jane', 
    familyName: 'Doe', 
    birthDate: '01.01.1970',
);

final CosmosDocument document = await cosmosDb.document.create(
    dbId: '<DB_ID>',
    collectionId: '<COLLECTION_ID>',
    partitionKey: '<DOCUMENT_PARTITION_KEY>',
    body: person.toMap(),
);

if (document.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.4.4 Replace a Document
The collection-replace operation returns a `Future<CosmosDocument>`.
```dart
final Person personUpdated = Person(
    id: '02',
    name: 'Jane', 
    familyName: 'Doe', 
    birthDate: '01.01.1970',
);

final CosmosDocument document = await cosmosDb.document.replace(
    dbId: '<DB_ID>',
    collectionId: '<COLLECTION_ID>',
    partitionKey: '<DOCUMENT_PARTITION_KEY>',
    documentId: '01',
    body: person.toMap(),
);

if (document.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.4.5 Delete a Document
The collection-replace operation returns a `Future<CosmosDocument>`.
```dart
final CosmosDocument document = await cosmosDb.document.delete(
    dbId: '<DB_ID>',
    collectionId: '<COLLECTION_ID>',
    partitionKey: '<DOCUMENT_PARTITION_KEY>',
    documentId: '01',
);

if (document.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.4.6 The Document model

### 3.5 Stored Procedures
A stored procedure is a piece of application logic written in JavaScript that is registered and executed against a collection as a single transaction. In Azure Cosmos DB, JavaScript is hosted in the same memory space as the database. Hence, requests made within stored procedures execute in the same scope as a database session. This process enables Azure Cosmos DB to guarantee ACID for all operations that are part of a single stored procedure.

#### 3.5.1 List Stored Procedures
The stored-procedure-list operation returns a `Future<StoredProcedureList>` with a list of  `StoredProcedure` or an error object.
```dart
final StoredProcedureList storedProcedureList = await cosmosDb.storedProcedure
    .list(dbId: '<DB_ID>', collectionId: '<COLLECTION_ID>');

if (storedProcedureList.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.5.2 Create a Stored Procedure
The stored-procedure-create operation returns a `Future<StoredProcedure>`.
```dart
final StoredProcedure storedProcedure = await cosmosDb.storedProcedure.create(
    dbId: '<DB_ID>',
    collectionId: '<COLLECTION_ID>',
    storedProcedureId: '<SPROC_ID>',
    function:
        'function (docToCreate, addedPropertyName, addedPropertyValue { getContext().getResponse().setBody(\'Hello World\'); }',
);

if (storedProcedure.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.5.3 Replace a Stored Procedure
The stored-procedure-replace operation returns a `Future<StoredProcedure>`.
```dart
final StoredProcedure storedProcedure = await cosmosDb.storedProcedure.replace(
    dbId: '<DB_ID>',
    collectionId: '<COLLECTION_ID>',
    storedProcedureId: '<SPROC_ID>',
    function:
        'function (docToCreate, addedPropertyName, addedPropertyValue { getContext().getResponse().setBody(\'Hello Updated SPROC\'); }',
);

if (storedProcedure.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.5.4 Delete a Stored Procedure
The stored-procedure-delete operation returns a `Future<StoredProcedure>`.
```dart
final StoredProcedure storedProcedure = await cosmosDb.storedProcedure.delete(
    dbId: '<DB_ID>',
    collectionId: '<COLLECTION_ID>',
    storedProcedureId: '<SPROC_ID>',
);

if (storedProcedure.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.5.5 The Stored Procedure model

### 3.6 User Defined Functions
A user-defined function (UDF) is a side effect free piece of application logic written in JavaScript. It allows developers to construct a query operator, thus extending the core of the Cosmos DB query language. Like stored procedures, UDFs live in the confines of a collection, thus confining the application logic to the collection.

#### 3.6.1 List User Defined Functions
The user-defined-function-list operation returns a `Future<UserDefinedFunctionList>` with a list of  `UserDefinedFunction` or an error object.
```dart
final UserDefinedFunctionList userDefinedFunctionList = await cosmosDb.userDefinedFunctions.list(
    dbId: '<DB_ID>',
    collectionId: '<COLLECTION_ID>',
);

if (userDefinedFunctionList.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.6.2 Create a User Defined Function
The user-defined-function-create operation returns a `Future<UserDefinedFunction>`.
```dart
final UserDefinedFunction userDefinedFunction = await cosmosDb.userDefinedFunctions.create(
    dbId: '<DB_ID>',
    collectionId: '<COLLECTION_ID>',
    userDefinedFunctionId: '<UDFS_ID>',
    function: 'function updateMetadata() { ... }',
);

if (userDefinedFunction.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.6.3 Replace a User Defined Function
The user-defined-function-replace operation returns a `Future<UserDefinedFunction>`.
```dart
final UserDefinedFunction userDefinedFunction = await cosmosDb.userDefinedFunctions.replace(
    dbId: '<DB_ID>',
    collectionId: '<COLLECTION_ID>',
    userDefinedFunctionId: '<UDFS_ID>',
    function: 'function updateMetadata() { ...Updated function... }',
);

if (userDefinedFunction.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.6.4 Delete a User Defined Function
The user-defined-function-delete operation returns a `Future<UserDefinedFunction>`.
```dart
final UserDefinedFunction userDefinedFunction = await cosmosDb.userDefinedFunctions.delete(
    dbId: '<DB_ID>',
    collectionId: '<COLLECTION_ID>',
    userDefinedFunctionId: '<UDFS_ID>',
);

if (userDefinedFunction.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.6.5 The User Defined Function model

### 3.7 Triggers
Triggers are pieces of application logic that can be executed before (pre-triggers) and after (post-triggers) creation, deletion, and replacement of a document. Triggers are written in JavaScript. Both pre and post triggers do not take parameters. Like stored procedures, triggers live within the confines of a collection, thus confining the application logic to the collection.

#### 3.7.1 List Triggers
The trigger-list operation returns a `Future<TriggerList>` with a list of  `Trigger` or an error object.
```dart
final TriggerList triggerList = await cosmosDb.trigger.list(
    dbId: '<DB_ID>',
    collectionId: '<COLLECTION_ID>',
);

if (triggerList.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.7.2 Create a Trigger
The trigger-create operation returns a `Future<Trigger>`.
```dart
final Trigger trigger = await cosmosDb.trigger.create(
    dbId: '<DB_ID>',
    collectionId: '<COLLECTION_ID>',
    triggerId: '<TRIGGER_ID>',
    function: 'function updateMetadata() { ... }',
    triggerOperation: TriggerOperation.all,
    triggerType: TriggerType.post,
);

if (trigger.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.7.3 Replace a Trigger
The trigger-replace operation returns a `Future<Trigger>`.
```dart
final Trigger trigger = await cosmosDb.trigger.replace(
    dbId: '<DB_ID>',
    collectionId: '<COLLECTION_ID>',
    triggerId: '<TRIGGER_ID>',
    function: 'function updateMetadata() { ...Updated function... }',
    triggerOperation: TriggerOperation.all,
    triggerType: TriggerType.post,
);

if (trigger.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.7.4 Delete a Trigger
The trigger-delete operation returns a `Future<Trigger>`.
```dart
final Trigger trigger = await cosmosDb.trigger.delete(
    dbId: '<DB_ID>',
    collectionId: '<COLLECTION_ID>',
    triggerId: '<TRIGGER_ID>',
);

if (trigger.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.7.5 The Trigger model

### 3.8 Users
A user is a logical namespace for scoping permissions on collections, documents, attachments, stored procedures, triggers, and user-defined functions. The user construct lives under a database resource and thus cannot cross the database boundary it is under. The user resource is represented by users in the Azure Cosmos DB REST resource model. It is a system resource, and thus contains a fixed schema.

#### 3.8.1 List Users
The user-list operation returns a `Future<UserList>` with a list of  `User` or an error object.
```dart
final UserList userList = await cosmosDb.user.list(dbId: '<DB_ID>');

if (userList.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.8.2 Get a User
The user-get operation returns a `Future<User>`.
```dart
final User user = await cosmosDb.user.get(
    dbId: '<DB_ID>',
    userId: '<USER_ID>',
);

if (user.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.8.3 Create a User
The user-create operation returns a `Future<User>`.
```dart
final User user = await cosmosDb.user.create(
    dbId: '<DB_ID>',
    userId: '<USER_ID>',
);

if (user.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.8.4 Replace a User
The user-replace operation returns a `Future<User>`.
```dart
final User user = await cosmosDb.user.replace(
    dbId: '<DB_ID>',
    userId: '<USER_ID>',
    newUserId: '<NEW_USER_ID>',
);

if (user.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.8.5 Delete a User
The user-delete operation returns a `Future<User>`.
```dart
final User user = await cosmosDb.user.delete(
    dbId: '<DB_ID>',
    userId: '<USER_ID>',
);

if (user.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.8.6 The User model

### 3.9 Permissions
Permission is an authorization token associated with a user for authorized access to a specific resource. It is used to manage access to collections, documents, attachments, stored procedures, triggers, and user-defined functions for a particular user.

#### 3.9.1 List Permissions
The permission-list operation returns a `Future<PermissionList>` with a list of  `Permission` or an error object.
```dart
final PermissionList permissionList = await cosmosDb.permission.list(
    dbId: '<DB_ID>',
    userId: '<USER_ID>',
);

if (permissionList.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.9.2 Get a Permission
The permission-get operation returns a `Future<Permission>`.
```dart
final Permission permission = await cosmosDb.permission.get(
    dbId: '<DB_ID>',
    userId: '<USER_ID>',
    permissionId: '<PERMISSION_ID>',
);

if (permission.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.9.3 Create a Permission
The permission-create operation returns a `Future<Permission>`.
```dart
final Permission permission = await cosmosDb.permission.create(
    dbId: '<DB_ID>',
    userId: '<USER_ID>',
    collectionId: '<COLLECTION_ID>',
    permissionId: '<PERMISSION_ID>',
    permissionMode: PermissionMode.all,
);

if (permission.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.9.4 Replace a Permission
The permission-replace operation returns a `Future<Permission>`.
```dart
final Permission permission = await cosmosDb.permission.replace(
    dbId: '<DB_ID>',
    userId: '<USER_ID>',
    collectionId: '<COLLECTION_ID>',
    permissionId: '<PERMISSION_ID>',
    newPermissionId: '<NEW_PERMISSION_ID>',
    permissionMode: PermissionMode.all,
);

if (permission.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.9.5 Delete a Permission
The permission-delete operation returns a `Future<Permission>`.
```dart
final Permission permission = await cosmosDb.permission.delete(
    dbId: '<DB_ID>',
    userId: '<USER_ID>',
    permissionId: '<PERMISSION_ID>',
);

if (permission.error.isEmpty) {
    // If the error is empty, continue....
}
```
TODO: show model description

#### 3.9.6 The Permission model

## 4 Where to go from here

## 5 Bugs and issues
Please file feature requests and bugs at the [issue tracker](https://github.com/Pat992/dart_azure_cosmosdb/issues)