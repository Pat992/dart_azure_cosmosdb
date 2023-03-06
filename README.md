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
    - [3.2.5 The CosmosDatabase model](#325-the-cosmosdatabase-model)
  - [3.3 Collections](#53-collections)
    - [3.3.1 List Collections](#331-list-collections)
    - [3.3.2 Get a Collection](#332-get-a-collection)
    - [3.3.3 Create a Collection](#333-create-a-collection)
    - [3.3.4 Delete a Collection](#334-delete-a-collection)
    - [3.3.5 The Collection model](#335-the-collection-model)
  - [3.4 Documents](#34-documents)
    - [3.4.1 List Documents](#341-list-documents)
    - [3.4.2 Get a Document](#342-get-a-document)
    - [3.4.3 Create a Document](#343-create-a-document)
    - [3.4.4 Replace a Document](#344-replace-a-document)
    - [3.4.5 Delete a Document](#345-delete-a-document)
    - [3.4.6 The CosmosDocument model](#346-the-cosmosdocument-model)
  - [3.5 Stored Procedures](#35-stored-procedures)
    - [3.5.1 List Stored Procedures](#351-list-stored-procedures)
    - [3.5.2 Create a Stored Procedure](#352-create-a-stored-procedure)
    - [3.5.3 Replace a Stored Procedure](#353-replace-a-stored-procedure)
    - [3.5.4 Delete a Stored Procedure](#354-delete-a-stored-procedure)
    - [3.5.5 The Stored Procedure model](#355-the-stored-procedure-model)
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
List the databases under the database account, performs a GET on the databases resource.

The database-list operation returns a `Future<CosmosDatabaseList>` with a list of  `CosmosDatabase` or an error object.
See [3.2.5 The Database model](#325-the-database-model) for information on the returned model and its variables.
```dart
final CosmosDatabaseList databaseList = await cosmosDb.database.list();

if(databaseList.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.2.2 Get a Database
Retrieve a database resource, performs a GET on the database resource.

The database-get operation returns a `Future<CosmosDatabase>`.
See [3.2.5 The Database model](#325-the-database-model) for information on the returned model and its variables.
```dart
final CosmosDatabase database = await cosmosDb.database.get(
    // REQUIRED -> User generated name/id of the database.
    dbId: '<DB_ID>',
);

if (database.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.2.3 Create a Database
The create-operation creates a new database in the database account.

The database-create operation returns a `Future<CosmosDatabase>`.
See [3.2.5 The Database model](#325-the-database-model) for information on the returned model and its variables.
```dart
final CosmosDatabase database = await cosmosDb.database.create(
    // REQUIRED -> User generated name/id of the database to be created.
    dbId: '<DB_ID>',
);

if (database.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.2.4 Delete a Database
The delete-operation deletes an existing database in the database account.

The database-delete operation returns a `Future<CosmosDatabase>`.
See [3.2.5 The Database model](#325-the-database-model) for information on the returned model and its variables.
```dart
final CosmosDatabase database = await cosmosDb.database.delete(
    // REQUIRED -> User generated name/id of the database to be deleted.
    dbId: '<DB_ID>',
);

if (database.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.2.5 The CosmosDatabase model
##### `CosmosDatabase`

**Methods**
`CosmosDatabase.toMap()` -> Transforms the model to a Map for the CosmosDB API.
`CosmosDatabase.toMap(Map<String, dynamic> map)` -> Transforms a Map from the CosmosDB API to the model.

**Variables**
<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Azure API key name</th>
            <th>Example</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><code>id</code></td>
            <td><code>id</code></td>
            <td>myId1</td>
            <td>The unique user generated name for the resource, max 255 chars.</td>
        </tr>
        <tr>
            <td><code>rid</code></td>
            <td><code>_rid</code></td>
            <td>qicAAA==</td>
            <td>System generated property. The resource ID (_rid) is a unique identifier. It is used internally for placement of and navigation to the resource.</td>
        </tr>
        <tr>
            <td><code>ts</code></td>
            <td><code>_ts</code></td>
            <td>1446192371</td>
            <td>System generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.</td>
        </tr>
        <tr>
            <td><code>self</code></td>
            <td><code>_self</code></td>
            <td>dbs\/qicAAA==\/</td>
            <td>System generated property. It is the unique addressable URI for the resource.</td>
        </tr>
        <tr>
            <td><code>etag</code></td>
            <td><code>_etag</code></td>
            <td>00001800-...</td>
            <td>System generated property representing the resource etag required for optimistic concurrency control.</td>
        </tr>
        <tr>
            <td><code>error</code></td>
            <td><code>code</code>,<br><code>message</code></td>
            <td>{<br>"code": "...",<br>"message": "..."<br>}</td>
            <td>An empty Map in case of a successful transaction, else a map with a code and a message.</td>
        </tr>
        <tr>
            <td><code>colls</code></td>
            <td><code>_colls</code></td>
            <td>colls/</td>
            <td>It is a system generated property that specifies the addressable path of the collections resource.</td>
        </tr>
        <tr>
            <td><code>users</code></td>
            <td><code>_users</code></td>
            <td>users/</td>
            <td>It is a system generated property that specifies the addressable path of the users resource.</td>
        </tr>
    </tbody>
</table>

##### `CosmosDatabaseList`
**Methods**
`CosmosDatabaseList.toMap()` -> Transforms the model to a Map for the CosmosDB API.
`CosmosDatabaseList.toMap(Map<String, dynamic> map)` -> Transforms a Map from the CosmosDB API to the model.

**Variables**
<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Azure API key name</th>
            <th>Example</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><code>rid</code></td>
            <td><code>_rid</code></td>
            <td>qicAAA==</td>
            <td>System generated property. The resource ID (_rid) is a unique identifier. It is used internally for placement of and navigation to the resource.</td>
        </tr>
        <tr>
            <td><code>count</code></td>
            <td><code>_count</code></td>
            <td>3</td>
            <td>This property shows the number of resources returned as part of list operation.</td>
        </tr>
        <tr>
            <td><code>error</code></td>
            <td><code>code</code>,<br><code>message</code></td>
            <td>{<br>"code": "...",<br>"message": "..."<br>}</td>
            <td>An empty Map in case of a successful transaction, else a map with a code and a message.</td>
        </tr>
        <tr>
            <td><code>databases</code></td>
            <td><code>Databases</code></td>
            <td>[]</td>
            <td>A list of CosmosDB databases. <code>List&lt;CosmosDatabase&gt;</code></td>
        </tr>
    </tbody>
</table>

### 3.3 Collections
A collection is a container of JSON documents and associated JavaScript application logic, i.e. stored procedures, triggers and user-defined functions.

#### 3.3.1 List Collections
Performing a GET on the collections resource of a particular database, i.e. the colls URI path, returns a list of the collections in the database.

The collection-list operation returns a `Future<CollectionList>` with a list of  `Collection` or an error object.
See [3.3.5 The Collection model](#335-the-collection-model) for information on the returned model and its variables.
```dart
final CollectionList collectionList = await cosmosDb.collection.list(
    // REQUIRED -> User generated name/id of the database in which the collections are located.
    dbId: '<DB_ID>',
);

if (collectionList.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.3.2 Get a Collection
Performing a GET on a specific collection resource retrieves the properties for the collection.

The collection-get operation returns a `Future<Collection>`.
See [3.3.5 The Collection model](#335-the-collection-model) for information on the returned model and its variables.
```dart
final Collection collection = await cosmosDb.collection.get(
    // REQUIRED -> User generated name/id of the database in which the collection is located.
    dbId: '<DB_ID>',
    // REQUIRED -> Name of the existing collection.
    collectionId: '<COLLECTION_ID>',
);

if (collection.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.3.3 Create a Collection
The create-operation creates a new collection in a database.

The collection-create operation returns a `Future<Collection>`.
See [3.3.5 The Collection model](#335-the-collection-model) for information on the returned model and its variables.
```dart
final Collection collection = await cosmosDb.collection.create(
    // REQUIRED -> User generated name/id of the database in which the collections are saved.
    dbId: '<DB_ID>',
    // REQUIRED -> Name of the collection to be created.
    collectionId: '<COLLECTION_ID>',
    // REQUIRED -> The partition key to be used for partitioning data into multiple partitions.
    partitionKey: '/id',
    // REQUIRED -> Set this value to 2, to use a large partition key, else set it to 1.
    version: 1,
);

if (collection.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.3.4 Delete a Collection
The delete-operation deletes an existing collection in a database.

The collection-delete operation returns a `Future<Collection>`.
See [3.3.5 The Collection model](#335-the-collection-model) for information on the returned model and its variables.
```dart
final Collection collection = await cosmosDb.collection.delete(
    // REQUIRED -> User generated name/id of the database in which the collection is located.
    dbId: '<DB_ID>', 
    // REQUIRED -> Name of the collection to be deleted.
    collectionId: '<COLLECTION_ID>',
);

if (collection.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.3.5 The Collection model
##### `Collection`
**Methods**
`Collection.toMap()` -> Transforms the model to a Map for the CosmosDB API.
`Collection.toMap(Map<String, dynamic> map)` -> Transforms a Map from the CosmosDB API to the model.

**Variables**
<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Azure API key name</th>
            <th>Example</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><code>id</code></td>
            <td><code>id</code></td>
            <td>myId1</td>
            <td>The unique user generated name for the resource, max 255 chars.</td>
        </tr>
        <tr>
            <td><code>rid</code></td>
            <td><code>_rid</code></td>
            <td>qicAAA==</td>
            <td>System generated property. The resource ID (_rid) is a unique identifier. It is used internally for placement of and navigation to the resource.</td>
        </tr>
        <tr>
            <td><code>ts</code></td>
            <td><code>_ts</code></td>
            <td>1446192371</td>
            <td>System generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.</td>
        </tr>
        <tr>
            <td><code>self</code></td>
            <td><code>_self</code></td>
            <td>dbs\/qicAAA==\/</td>
            <td>System generated property. It is the unique addressable URI for the resource.</td>
        </tr>
        <tr>
            <td><code>etag</code></td>
            <td><code>_etag</code></td>
            <td>00001800-...</td>
            <td>System generated property representing the resource etag required for optimistic concurrency control.</td>
        </tr>
        <tr>
            <td><code>error</code></td>
            <td><code>code</code>,<br><code>message</code></td>
            <td>{<br>"code": "...",<br>"message": "..."<br>}</td>
            <td>An empty Map in case of a successful transaction, else a map with a code and a message.</td>
        </tr>
        <tr>
            <td><code>docs</code></td>
            <td><code>_docs</code></td>
            <td>docs/</td>
            <td>It is a system generated property that specifies the addressable path of the documents resource.</td>
        </tr>
        <tr>
            <td><code>sprocs</code></td>
            <td><code>_sprocs</code></td>
            <td>sprocs/</td>
            <td>It is a system generated property that specifies the addressable path of the stored procedures (sprocs) resource.</td>
        </tr>
        <tr>
            <td><code>triggers</code></td>
            <td><code>_triggers</code></td>
            <td>triggers/</td>
            <td>It is a system generated property that specifies the addressable path of the triggers resource.</td>
        </tr>
        <tr>
            <td><code>udfs</code></td>
            <td><code>_udfs</code></td>
            <td>udfs/</td>
            <td>It is a system generated property that specifies the addressable path of the user-defined functions (udfs) resource.</td>
        </tr>
        <tr>
            <td><code>conflicts</code></td>
            <td><code>_conflicts</code></td>
            <td>conflicts/</td>
            <td>It is a system generated property that specifies the addressable path of the conflicts resource.</td>
        </tr>
        <tr>
            <td><code>partitionKey</code></td>
            <td><code>partitionKey</code></td>
            <td>{<br>"paths": [ "/AccountNumber" ],<br>"kind": "Hash",<br>"Version": 2<br>}</td>
            <td>This value is used to configure the partition key to be used for partitioning data into multiple partitions.</td>
        </tr>
        <tr>
            <td><code>indexingPolicy</code></td>
            <td><code>indexingPolicy</code></td>
            <td>[{<br>"path": "/*",<br>"indexes": [{ "dataType": "String",<br>"precision": -1,<br> "kind": "Range" }]<br>}]</td>
            <td>This value is used to configure indexing policy. By default, the indexing is automatic for all document paths within the collection.</td>
        </tr>
        <tr>
            <td><code>uniqueKeyPolicy</code></td>
            <td><code>uniqueKeyPolicy</code></td>
            <td>[]</td>
            <td>With unique keys, you make sure that one or more values within a logical partition is unique. By default, the unique key policy is an empty array or null as an object.</td>
        </tr>
        <tr>
            <td><code>geospatialConfig</code></td>
            <td><code>geospatialConfig</code></td>
            <td>{<br>"type": "Geography"<br>}</td>
            <td>The Geospatial Configuration specifies how the spatial data will be indexed. Specify one Geospatial Configuration per container: geography or geometry.</td>
        </tr>
    </tbody>
</table>

##### `CollectionList`
**Methods**
`CollectionList.toMap()` -> Transforms the model to a Map for the CosmosDB API.
`CollectionList.toMap(Map<String, dynamic> map)` -> Transforms a Map from the CosmosDB API to the model.

**Variables**
<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Azure API key name</th>
            <th>Example</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><code>rid</code></td>
            <td><code>_rid</code></td>
            <td>qicAAA==</td>
            <td>System generated property. The resource ID (_rid) is a unique identifier. It is used internally for placement of and navigation to the resource.</td>
        </tr>
        <tr>
            <td><code>count</code></td>
            <td><code>_count</code></td>
            <td>3</td>
            <td>This property shows the number of resources returned as part of list operation.</td>
        </tr>
        <tr>
            <td><code>error</code></td>
            <td><code>code</code>,<br><code>message</code></td>
            <td>{<br>"code": "...",<br>"message": "..."<br>}</td>
            <td>An empty Map in case of a successful transaction, else a map with a code and a message.</td>
        </tr>
        <tr>
            <td><code>collections</code></td>
            <td><code>DocumentCollections</code></td>
            <td>[]</td>
            <td>A list of CosmosDB collections. <code>List&lt;Collection&gt;</code></td>
        </tr>
    </tbody>
</table>

### 3.4 Documents
A document consists of user-defined content in JSON format. Aside from the required ID property, users can define any arbitrary elements, structures, and hierarchies for the content. The ID element is a unique string that is user-settable and must not exceed 255 characters. You can insert, replace, delete, read, enumerate, and query arbitrary JSON documents in a collection.

#### 3.4.1 List Documents
Performing a GET on the documents resource of a particular collection, i.e. the docs URI path, returns a list of documents under the collection.

The document-list operation returns a `Future<CosmosDocumentList>` with a list of  `CosmosDocument` or an error object.
See [3.4.6 The Document model](#346-the-document-model) for information on the returned model and its variables.
```dart
final CosmosDocumentList documentList = await cosmosDb.document.list(
    // REQUIRED -> User generated name/id of the database.
    dbId: '<DB_ID>',
    // REQUIRED -> Id/name of the collection.
    collectionId: '<COLLECTION_ID>',
);

if (documentList.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.4.2 Get a Document
The get-operation retrieves a document by its partition key and document key.

The collection-get operation returns a `Future<CosmosDocument>`.
See [3.4.6 The Document model](#346-the-document-model) for information on the returned model and its variables.
```dart
final CosmosDocument document = await cosmosDb.document.get(
    // REQUIRED -> User generated name/id of the database.
    dbId: '<DB_ID>',
    // REQUIRED -> Id/name of the collection.
    collectionId: '<COLLECTION_ID>',
    // REQUIRED -> Id of the document to be retrieved.
    documentId: '<DOCUMENT_ID>',
    // REQUIRED -> Partition key value for the document to be received.
    partitionKey: '<DOCUMENT_PARTITION_KEY>',
);

if (document.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.4.3 Create a Document
The create-operation creates a new document in a collection.

The collection-create operation returns a `Future<CosmosDocument>`.
See [3.4.6 The Document model](#346-the-document-model) for information on the returned model and its variables.
```dart

// Example: Create an instance of a Person to write to the document.
final Person person = Person(
    id: '01',
    name: 'Jane', 
    familyName: 'Doe', 
    birthDate: '01.01.1970',
);

final CosmosDocument document = await cosmosDb.document.create(
    // REQUIRED -> User generated name/id of the database.
    dbId: '<DB_ID>',
    // REQUIRED -> Id/name of the collection.
    collectionId: '<COLLECTION_ID>',
    // REQUIRED -> Partition key value for the document to be created.
    // In this example the partition-key /id is used.
    partitionKey: person.id,
    // REQUIRED -> Any map with Strings as keys and dynamic values that will be added to the document.
    // In this example the Person-instance is transformed into a map.
    body: person.toMap(),
);

if (document.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.4.4 Replace a Document
The replace-operation replaces the entire content of a document.

The collection-replace operation returns a `Future<CosmosDocument>`.
See [3.4.6 The Document model](#346-the-document-model) for information on the returned model and its variables.
```dart
// Example: Create an instance of a Person to overwrite.
final Person personUpdated = Person(
    id: '02',
    name: 'Jane', 
    familyName: 'Doe', 
    birthDate: '01.01.1970',
);

final CosmosDocument document = await cosmosDb.document.replace(
    // REQUIRED -> User generated name/id of the database.
    dbId: '<DB_ID>',
    // REQUIRED -> Id/name of the collection.
    collectionId: '<COLLECTION_ID>',
    // REQUIRED -> Partition key value for the document to be created.
    // In this example the partition-key /id is used.
    partitionKey: person.id,
    // REQUIRED -> Id of the document to be replaced.
    documentId: '01',
    // REQUIRED -> Any map with Strings as keys and dynamic values that will replace the previous body.
    // In this example the Person-instance is transformed into a map.
    body: person.toMap(),
);

if (document.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.4.5 Delete a Document
The delete-operation deletes an existing document in a collection.

The collection-replace operation returns a `Future<CosmosDocument>`.
See [3.4.6 The Document model](#346-the-document-model) for information on the returned model and its variables.
```dart
final CosmosDocument document = await cosmosDb.document.delete(
    // REQUIRED -> User generated name/id of the database.
    dbId: '<DB_ID>',
    // REQUIRED -> Id/name of the collection.
    collectionId: '<COLLECTION_ID>',
    // REQUIRED -> Partition key value for the document to be deleted.
    partitionKey: '<DOCUMENT_PARTITION_KEY>',
    // REQUIRED -> Id of the document to be deleted.
    documentId: '01',
);

if (document.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.4.6 The CosmosDocument model
##### `CosmosDocument`
**Methods**
`CosmosDocument.toMap()` -> Transforms the model to a Map for the CosmosDB API.
`CosmosDocument.toMap(Map<String, dynamic> map)` -> Transforms a Map from the CosmosDB API to the model.

**Variables**
<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Azure API key name</th>
            <th>Example</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><code>id</code></td>
            <td><code>id</code></td>
            <td>myId1</td>
            <td>The unique user generated name for the resource, max 255 chars.</td>
        </tr>
        <tr>
            <td><code>rid</code></td>
            <td><code>_rid</code></td>
            <td>qicAAA==</td>
            <td>System generated property. The resource ID (_rid) is a unique identifier. It is used internally for placement of and navigation to the resource.</td>
        </tr>
        <tr>
            <td><code>ts</code></td>
            <td><code>_ts</code></td>
            <td>1446192371</td>
            <td>System generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.</td>
        </tr>
        <tr>
            <td><code>self</code></td>
            <td><code>_self</code></td>
            <td>dbs\/qicAAA==\/</td>
            <td>System generated property. It is the unique addressable URI for the resource.</td>
        </tr>
        <tr>
            <td><code>etag</code></td>
            <td><code>_etag</code></td>
            <td>00001800-...</td>
            <td>System generated property representing the resource etag required for optimistic concurrency control.</td>
        </tr>
        <tr>
            <td><code>error</code></td>
            <td><code>code</code>,<br><code>message</code></td>
            <td>{<br>"code": "...",<br>"message": "..."<br>}</td>
            <td>An empty Map in case of a successful transaction, else a map with a code and a message.</td>
        </tr>
        <tr>
            <td><code>attachments</code></td>
            <td><code>_attachments</code></td>
            <td>attachments/</td>
            <td>It is a system generated property that specifies the addressable path for the attachments resource.</td>
        </tr>
        <tr>
            <td><code>values</code></td>
            <td><code>...</code></td>
            <td>{<br>"key1": "val1",<br>"key2": "val2"<br>}</td>
            <td>Any map of key-value pairs to save or retrieve in a document.</td>
        </tr>
    </tbody>
</table>

##### `CosmosDocumentList`
**Methods**
`CosmosDocumentList.toMap()` -> Transforms the model to a Map for the CosmosDB API.
`CosmosDocumentList.toMap(Map<String, dynamic> map)` -> Transforms a Map from the CosmosDB API to the model.

**Variables**
<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Azure API key name</th>
            <th>Example</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><code>rid</code></td>
            <td><code>_rid</code></td>
            <td>qicAAA==</td>
            <td>System generated property. The resource ID (_rid) is a unique identifier. It is used internally for placement of and navigation to the resource.</td>
        </tr>
        <tr>
            <td><code>count</code></td>
            <td><code>_count</code></td>
            <td>3</td>
            <td>This property shows the number of resources returned as part of list operation.</td>
        </tr>
        <tr>
            <td><code>error</code></td>
            <td><code>code</code>,<br><code>message</code></td>
            <td>{<br>"code": "...",<br>"message": "..."<br>}</td>
            <td>An empty Map in case of a successful transaction, else a map with a code and a message.</td>
        </tr>
        <tr>
            <td><code>documents</code></td>
            <td><code>Documents</code></td>
            <td>[]</td>
            <td>A list of CosmosDB documents. <code>List&lt;CosmosDocument&gt;</code></td>
        </tr>
    </tbody>
</table>

### 3.5 Stored Procedures
A stored procedure is a piece of application logic written in JavaScript that is registered and executed against a collection as a single transaction. In Azure Cosmos DB, JavaScript is hosted in the same memory space as the database. Hence, requests made within stored procedures execute in the same scope as a database session. This process enables Azure Cosmos DB to guarantee ACID for all operations that are part of a single stored procedure.

#### 3.5.1 List Stored Procedures
Performing a GET on the stored procedures resource of a particular database, that is, the sprocs URI path, returns a list of the stored procedures in the collection.

The stored-procedure-list operation returns a `Future<StoredProcedureList>` with a list of  `StoredProcedure` or an error object.
See [3.5.5 The Stored Procedure model](#355-the-stored-procedure-model) for information on the returned model and its variables.
```dart
final StoredProcedureList storedProcedureList = await cosmosDb.storedProcedure.list(
    // REQUIRED -> User generated name/id of the database.
    dbId: '<DB_ID>',
    // REQUIRED -> Name of the collection where the stored procedures reside.
    collectionId: '<COLLECTION_ID>',
);

if (storedProcedureList.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.5.2 Create a Stored Procedure
The create-operation creates a new stored procedure in a collection.

The stored-procedure-create operation returns a `Future<StoredProcedure>`.
See [3.5.5 The Stored Procedure model](#355-the-stored-procedure-model) for information on the returned model and its variables.
```dart
final StoredProcedure storedProcedure = await cosmosDb.storedProcedure.create(
    // REQUIRED -> User generated name/id of the database.
    dbId: '<DB_ID>',
    // REQUIRED -> Name of the collection where the stored procedure is created.
    collectionId: '<COLLECTION_ID>',
    // REQUIRED -> The user generated unique name for the stored procedure, max 255 chars.
    storedProcedureId: '<SPROC_ID>',
    // REQUIRED -> The body of the stored procedure as a String.
    function: 'function () { ... }',
);

if (storedProcedure.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.5.3 Replace a Stored Procedure
Replaces the entire stored procedure resource.
All user-settable properties, including the ID and the body, must be submitted in the body to perform the replacement.

The stored-procedure-replace operation returns a `Future<StoredProcedure>`.
See [3.5.5 The Stored Procedure model](#355-the-stored-procedure-model) for information on the returned model and its variables.
```dart
final StoredProcedure storedProcedure = await cosmosDb.storedProcedure.replace(
    // REQUIRED -> User generated name/id of the database.
    dbId: '<DB_ID>',
    // REQUIRED -> Name of the collection where the stored procedure is updated.
    collectionId: '<COLLECTION_ID>',
    // REQUIRED -> The user generated unique name for an existing stored procedure.
    storedProcedureId: '<SPROC_ID>',
    // REQUIRED -> The body of the stored procedure as a String, will replace the current function.
    function: 'function () { ...Updated function... }',
);

if (storedProcedure.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.5.4 Delete a Stored Procedure
The delete-operation deletes an existing stored procedure in a collection.

The stored-procedure-delete operation returns a `Future<StoredProcedure>`.
See [3.5.5 The Stored Procedure model](#355-the-stored-procedure-model) for information on the returned model and its variables.
```dart
final StoredProcedure storedProcedure = await cosmosDb.storedProcedure.delete(
    // REQUIRED -> User generated name/id of the database.
    dbId: '<DB_ID>',
    // REQUIRED -> Name of the collection where the stored procedure is deleted from.
    collectionId: '<COLLECTION_ID>',
    // REQUIRED -> The user generated unique name for an existing stored procedure.
    storedProcedureId: '<SPROC_ID>',
);

if (storedProcedure.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.5.5 The Stored Procedure model
##### `StoredProcedure`
**Methods**
`StoredProcedure.toMap()` -> Transforms the model to a Map for the CosmosDB API.
`StoredProcedure.toMap(Map<String, dynamic> map)` -> Transforms a Map from the CosmosDB API to the model.

**Variables**
<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Azure API key name</th>
            <th>Example</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><code>id</code></td>
            <td><code>id</code></td>
            <td>myId1</td>
            <td>The unique user generated name for the resource, max 255 chars.</td>
        </tr>
        <tr>
            <td><code>rid</code></td>
            <td><code>_rid</code></td>
            <td>qicAAA==</td>
            <td>System generated property. The resource ID (_rid) is a unique identifier. It is used internally for placement of and navigation to the resource.</td>
        </tr>
        <tr>
            <td><code>ts</code></td>
            <td><code>_ts</code></td>
            <td>1446192371</td>
            <td>System generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.</td>
        </tr>
        <tr>
            <td><code>self</code></td>
            <td><code>_self</code></td>
            <td>dbs\/qicAAA==\/</td>
            <td>System generated property. It is the unique addressable URI for the resource.</td>
        </tr>
        <tr>
            <td><code>etag</code></td>
            <td><code>_etag</code></td>
            <td>00001800-...</td>
            <td>System generated property representing the resource etag required for optimistic concurrency control.</td>
        </tr>
        <tr>
            <td><code>error</code></td>
            <td><code>code</code>,<br><code>message</code></td>
            <td>{<br>"code": "...",<br>"message": "..."<br>}</td>
            <td>An empty Map in case of a successful transaction, else a map with a code and a message.</td>
        </tr>
        <tr>
            <td><code>body</code></td>
            <td><code>body</code></td>
            <td>function() { ... }</td>
            <td>A user settable property. It is the body of the stored procedure.</td>
        </tr>
    </tbody>
</table>

##### `StoredProcedureList`
**Methods**
`StoredProcedureList.toMap()` -> Transforms the model to a Map for the CosmosDB API.
`StoredProcedureList.toMap(Map<String, dynamic> map)` -> Transforms a Map from the CosmosDB API to the model.

**Variables**
<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Azure API key name</th>
            <th>Example</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><code>rid</code></td>
            <td><code>_rid</code></td>
            <td>qicAAA==</td>
            <td>System generated property. The resource ID (_rid) is a unique identifier. It is used internally for placement of and navigation to the resource.</td>
        </tr>
        <tr>
            <td><code>count</code></td>
            <td><code>_count</code></td>
            <td>3</td>
            <td>This property shows the number of resources returned as part of list operation.</td>
        </tr>
        <tr>
            <td><code>error</code></td>
            <td><code>code</code>,<br><code>message</code></td>
            <td>{<br>"code": "...",<br>"message": "..."<br>}</td>
            <td>An empty Map in case of a successful transaction, else a map with a code and a message.</td>
        </tr>
        <tr>
            <td><code>storedProcedures</code></td>
            <td><code>StoredProcedures</code></td>
            <td>[]</td>
            <td>A list of CosmosDB stored procedures. <code>List&lt;StoredProcedure&gt;</code></td>
        </tr>
    </tbody>
</table>

### 3.6 User Defined Functions
A user-defined function (UDF) is a side effect free piece of application logic written in JavaScript. It allows developers to construct a query operator, thus extending the core of the Cosmos DB query language. Like stored procedures, UDFs live in the confines of a collection, thus confining the application logic to the collection.

#### 3.6.1 List User Defined Functions
Performing a GET on the triggers resource of a particular database returns a list of the triggers in the collection.

The user-defined-function-list operation returns a `Future<UserDefinedFunctionList>` with a list of  `UserDefinedFunction` or an error object.
See [3.6.5 The User Defined Function model](#365-the-user-defined-function-model) for information on the returned model and its variables.
```dart
final UserDefinedFunctionList userDefinedFunctionList = await cosmosDb.userDefinedFunctions.list(
    // REQUIRED -> User generated name/id of the database.
    dbId: '<DB_ID>',
    // REQUIRED -> Id/name of the collection where the user defined functions reside.
    collectionId: '<COLLECTION_ID>',
);

if (userDefinedFunctionList.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.6.2 Create a User Defined Function
The create-operation creates a new stored procedure in a collection.

The user-defined-function-create operation returns a `Future<UserDefinedFunction>`.
See [3.6.5 The User Defined Function model](#365-the-user-defined-function-model) for information on the returned model and its variables.
```dart
final UserDefinedFunction userDefinedFunction = await cosmosDb.userDefinedFunctions.create(
    // REQUIRED -> User generated name/id of the database.
    dbId: '<DB_ID>',
    // REQUIRED -> Id/name of the collection where the user defined function is created.
    collectionId: '<COLLECTION_ID>',
    // REQUIRED -> Unique name to identify the user defined function, max 255 chars.
    userDefinedFunctionId: '<UDFS_ID>',
    // REQUIRED -> The body of the user defined function.
    function: 'function updateMetadata() { ... }',
);

if (userDefinedFunction.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.6.3 Replace a User Defined Function
Performing a PUT operation on a specific UDF resource replaces the entire UDF resource.
All user-settable properties, including the id and the body, must be submitted in the body to perform the replacement.

The user-defined-function-replace operation returns a `Future<UserDefinedFunction>`.
See [3.6.5 The User Defined Function model](#365-the-user-defined-function-model) for information on the returned model and its variables.
```dart
final UserDefinedFunction userDefinedFunction = await cosmosDb.userDefinedFunctions.replace(
    // REQUIRED -> User generated name/id of the database.
    dbId: '<DB_ID>',
    // REQUIRED -> Id/name of the collection where the user defined function is replaced.
    collectionId: '<COLLECTION_ID>',
    // REQUIRED -> Id/name of the user defined function to be replaced.
    userDefinedFunctionId: '<UDFS_ID>',
    // REQUIRED -> The body of the user defined function, will replace the current function.
    function: 'function updateMetadata() { ...Updated function... }',
);

if (userDefinedFunction.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.6.4 Delete a User Defined Function
The delete-operation deletes an existing user-defined function in a collection.

The user-defined-function-delete operation returns a `Future<UserDefinedFunction>`.
See [3.6.5 The User Defined Function model](#365-the-user-defined-function-model) for information on the returned model and its variables.
```dart
final UserDefinedFunction userDefinedFunction = await cosmosDb.userDefinedFunctions.delete(
    // REQUIRED -> User generated name/id of the database.
    dbId: '<DB_ID>',
    // REQUIRED -> Id/name of the collection where the user defined function is deleted from.
    collectionId: '<COLLECTION_ID>',
    // REQUIRED -> Id/name of the user defined function to be deleted.
    userDefinedFunctionId: '<UDFS_ID>',
);

if (userDefinedFunction.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.6.5 The User Defined Function model
##### `UserDefinedFunction`
**Methods**
`UserDefinedFunction.toMap()` -> Transforms the model to a Map for the CosmosDB API.
`UserDefinedFunction.toMap(Map<String, dynamic> map)` -> Transforms a Map from the CosmosDB API to the model.

**Variables**
<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Azure API key name</th>
            <th>Example</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><code>id</code></td>
            <td><code>id</code></td>
            <td>myId1</td>
            <td>The unique user generated name for the resource, max 255 chars.</td>
        </tr>
        <tr>
            <td><code>rid</code></td>
            <td><code>_rid</code></td>
            <td>qicAAA==</td>
            <td>System generated property. The resource ID (_rid) is a unique identifier. It is used internally for placement of and navigation to the resource.</td>
        </tr>
        <tr>
            <td><code>ts</code></td>
            <td><code>_ts</code></td>
            <td>1446192371</td>
            <td>System generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.</td>
        </tr>
        <tr>
            <td><code>self</code></td>
            <td><code>_self</code></td>
            <td>dbs\/qicAAA==\/</td>
            <td>System generated property. It is the unique addressable URI for the resource.</td>
        </tr>
        <tr>
            <td><code>etag</code></td>
            <td><code>_etag</code></td>
            <td>00001800-...</td>
            <td>System generated property representing the resource etag required for optimistic concurrency control.</td>
        </tr>
        <tr>
            <td><code>error</code></td>
            <td><code>code</code>,<br><code>message</code></td>
            <td>{<br>"code": "...",<br>"message": "..."<br>}</td>
            <td>An empty Map in case of a successful transaction, else a map with a code and a message.</td>
        </tr>
        <tr>
            <td><code>body</code></td>
            <td><code>body</code></td>
            <td>function() { ... }</td>
            <td>A user settable property. It is the body of the UDF.</td>
        </tr>
    </tbody>
</table>

##### `UserDefinedFunctionList`
**Methods**
`UserDefinedFunctionList.toMap()` -> Transforms the model to a Map for the CosmosDB API.
`UserDefinedFunctionList.toMap(Map<String, dynamic> map)` -> Transforms a Map from the CosmosDB API to the model.

**Variables**
<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Azure API key name</th>
            <th>Example</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><code>rid</code></td>
            <td><code>_rid</code></td>
            <td>qicAAA==</td>
            <td>System generated property. The resource ID (_rid) is a unique identifier. It is used internally for placement of and navigation to the resource.</td>
        </tr>
        <tr>
            <td><code>count</code></td>
            <td><code>_count</code></td>
            <td>3</td>
            <td>This property shows the number of resources returned as part of list operation.</td>
        </tr>
        <tr>
            <td><code>error</code></td>
            <td><code>code</code>,<br><code>message</code></td>
            <td>{<br>"code": "...",<br>"message": "..."<br>}</td>
            <td>An empty Map in case of a successful transaction, else a map with a code and a message.</td>
        </tr>
        <tr>
            <td><code>userDefinedFunctions</code></td>
            <td><code>UserDefinedFunctions</code></td>
            <td>[]</td>
            <td>A list of CosmosDB stored procedures. <code>List&lt;UserDefinedFunction&gt;</code></td>
        </tr>
    </tbody>
</table>

### 3.7 Triggers
Triggers are pieces of application logic that can be executed before (pre-triggers) and after (post-triggers) creation, deletion, and replacement of a document. Triggers are written in JavaScript. Both pre and post triggers do not take parameters. Like stored procedures, triggers live within the confines of a collection, thus confining the application logic to the collection.

#### 3.7.1 List Triggers
Performing a GET on the triggers resource of a particular database returns a list of the triggers in the collection.

The trigger-list operation returns a `Future<TriggerList>` with a list of  `Trigger` or an error object.
See [3.7.5 The Trigger model](#375-the-trigger-model) for information on the returned model and its variables.
```dart
final TriggerList triggerList = await cosmosDb.trigger.list(
    // REQUIRED -> User generated name/id of the database.
    dbId: '<DB_ID>',
    // REQUIRED -> Id/name of the collection where the triggers reside.
    collectionId: '<COLLECTION_ID>',
);

if (triggerList.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.7.2 Create a Trigger
The create-operation creates a new trigger in a collection.

The trigger-create operation returns a `Future<Trigger>`.
See [3.7.5 The Trigger model](#375-the-trigger-model) for information on the returned model and its variables.
```dart
final Trigger trigger = await cosmosDb.trigger.create(
    // REQUIRED -> User generated name/id of the database.
    dbId: '<DB_ID>',
    // REQUIRED -> Id/name of the collection where the triggers is created.
    collectionId: '<COLLECTION_ID>',
    // REQUIRED -> Unique name used to identify the trigger, max 255 chars.
    triggerId: '<TRIGGER_ID>',
    // REQUIRED -> The function of the trigger.
    function: 'function updateMetadata() { ... }',
    // REQUIRED -> Type of operation that invokes the trigger.
    // The acceptable values are: TriggerOperation.all, TriggerOperation.create, TriggerOperation.replace, and TriggerOperation.delete.
    triggerOperation: TriggerOperation.all,
    // REQUIRED -> This value specifies when the trigger is fired.
    // The acceptable values are: TriggerType.pre and TriggerType.post.
    // Pre triggers fire before an operation while Post triggers after an operation.
    triggerType: TriggerType.post,
);

if (trigger.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.7.3 Replace a Trigger
Performing a PUT operation on a specific trigger resource replaces the entire trigger resource.
All user-settable properties, including the ID, the body, the triggerOperation, and the triggerType, must be submitted in the body to perform the replacement.

The trigger-replace operation returns a `Future<Trigger>`.
See [3.7.5 The Trigger model](#375-the-trigger-model) for information on the returned model and its variables.
```dart
final Trigger trigger = await cosmosDb.trigger.replace(
    // REQUIRED -> User generated name/id of the database.
    dbId: '<DB_ID>',
    // REQUIRED -> Id/name of the collection where the triggers is replaced.
    collectionId: '<COLLECTION_ID>',
    // REQUIRED -> Id/name of the trigger to replace.
    triggerId: '<TRIGGER_ID>',
    function: 'function updateMetadata() { ...Updated function... }',
    // REQUIRED -> Type of operation that invokes the trigger.
    // The acceptable values are: TriggerOperation.all, TriggerOperation.create, TriggerOperation.replace, and TriggerOperation.delete.
    triggerOperation: TriggerOperation.all,
    // REQUIRED -> This value specifies when the trigger is fired.
    // The acceptable values are: TriggerType.pre and TriggerType.post.
    // Pre triggers fire before an operation while Post triggers after an operation.
    triggerType: TriggerType.post,
);

if (trigger.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.7.4 Delete a Trigger
The delete-operation deletes an existing trigger in a collection.

The trigger-delete operation returns a `Future<Trigger>`.
See [3.7.5 The Trigger model](#375-the-trigger-model) for information on the returned model and its variables.
```dart
final Trigger trigger = await cosmosDb.trigger.delete(
    // REQUIRED -> User generated name/id of the database.
    dbId: '<DB_ID>',
    // REQUIRED -> Id/name of the collection where the triggers is deleted from.
    collectionId: '<COLLECTION_ID>',
    // REQUIRED -> Id/name of the trigger to delete.
    triggerId: '<TRIGGER_ID>',
);

if (trigger.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.7.5 The Trigger model
##### `Trigger`
**Methods**
`Trigger.toMap()` -> Transforms the model to a Map for the CosmosDB API.
`Trigger.toMap(Map<String, dynamic> map)` -> Transforms a Map from the CosmosDB API to the model.

**Variables**
<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Azure API key name</th>
            <th>Example</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><code>id</code></td>
            <td><code>id</code></td>
            <td>myId1</td>
            <td>The unique user generated name for the resource, max 255 chars.</td>
        </tr>
        <tr>
            <td><code>rid</code></td>
            <td><code>_rid</code></td>
            <td>qicAAA==</td>
            <td>System generated property. The resource ID (_rid) is a unique identifier. It is used internally for placement of and navigation to the resource.</td>
        </tr>
        <tr>
            <td><code>ts</code></td>
            <td><code>_ts</code></td>
            <td>1446192371</td>
            <td>System generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.</td>
        </tr>
        <tr>
            <td><code>self</code></td>
            <td><code>_self</code></td>
            <td>dbs\/qicAAA==\/</td>
            <td>System generated property. It is the unique addressable URI for the resource.</td>
        </tr>
        <tr>
            <td><code>etag</code></td>
            <td><code>_etag</code></td>
            <td>00001800-...</td>
            <td>System generated property representing the resource etag required for optimistic concurrency control.</td>
        </tr>
        <tr>
            <td><code>error</code></td>
            <td><code>code</code>,<br><code>message</code></td>
            <td>{<br>"code": "...",<br>"message": "..."<br>}</td>
            <td>An empty Map in case of a successful transaction, else a map with a code and a message.</td>
        </tr>
        <tr>
            <td><code>body</code></td>
            <td><code>body</code></td>
            <td>function() { ... }</td>
            <td>A user settable property. It is the body of the trigger.</td>
        </tr>
        <tr>
            <td><code>triggerOperation</code></td>
            <td><code>triggerOperation</code></td>
            <td>TriggerOperation.all</td>
            <td>It is the type of operation that invokes the trigger.<br>The acceptable values are: TriggerOperation.all, TriggerOperation.insert, TriggerOperation.replace and TriggerOperation.delete.</td>
        </tr>
        <tr>
            <td><code>triggerType</code></td>
            <td><code>triggerType</code></td>
            <td>TriggerType.post</td>
            <td>This specifies when the trigger is fired. The acceptable values are: TriggerType.pre and TriggerType.post.<br>Pre triggers fire before an operation while Post triggers after an operation.</td>
        </tr>
    </tbody>
</table>

##### `TriggerList`
**Methods**
`TriggerList.toMap()` -> Transforms the model to a Map for the CosmosDB API.
`TriggerList.toMap(Map<String, dynamic> map)` -> Transforms a Map from the CosmosDB API to the model.

**Variables**
<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Azure API key name</th>
            <th>Example</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><code>rid</code></td>
            <td><code>_rid</code></td>
            <td>qicAAA==</td>
            <td>System generated property. The resource ID (_rid) is a unique identifier. It is used internally for placement of and navigation to the resource.</td>
        </tr>
        <tr>
            <td><code>count</code></td>
            <td><code>_count</code></td>
            <td>3</td>
            <td>This property shows the number of resources returned as part of list operation.</td>
        </tr>
        <tr>
            <td><code>error</code></td>
            <td><code>code</code>,<br><code>message</code></td>
            <td>{<br>"code": "...",<br>"message": "..."<br>}</td>
            <td>An empty Map in case of a successful transaction, else a map with a code and a message.</td>
        </tr>
        <tr>
            <td><code>triggers</code></td>
            <td><code>Triggers</code></td>
            <td>[]</td>
            <td>A list of CosmosDB triggers. <code>List&lt;Trigger&gt;</code></td>
        </tr>
    </tbody>
</table>

### 3.8 Users
A user is a logical namespace for scoping permissions on collections, documents, attachments, stored procedures, triggers, and user-defined functions. The user construct lives under a database resource and thus cannot cross the database boundary it is under. The user resource is represented by users in the Azure Cosmos DB REST resource model. It is a system resource, and thus contains a fixed schema.

#### 3.8.1 List Users
Performing a GET operation on the users resource of a particular database, i.e. the users URI path.

The user-list operation returns a `Future<UserList>` with a list of  `User` or an error object.
See [3.8.6 The Trigger model](#386-the-trigger-model) for information on the returned model and its variables.
```dart
final UserList userList = await cosmosDb.user.list(
    // REQUIRED -> User generated name/id of the database.
    dbId: '<DB_ID>',
);

if (userList.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.8.2 Get a User
Performing a GET operation on a single user with his id/name.

The user-get operation returns a `Future<User>`.
See [3.8.6 The Trigger model](#386-the-trigger-model) for information on the returned model and its variables.
```dart
final User user = await cosmosDb.user.get(
    // REQUIRED -> User generated name/id of the database.
    dbId: '<DB_ID>',
    // REQUIRED -> The id/name of the user.
    userId: '<USER_ID>',
);

if (user.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.8.3 Create a User
The create-operation creates a new user in a database.

The user-create operation returns a `Future<User>`.
See [3.8.6 The Trigger model](#386-the-trigger-model) for information on the returned model and its variables.
```dart
final User user = await cosmosDb.user.create(
    // REQUIRED -> User generated name/id of the database.
    dbId: '<DB_ID>',
    // REQUIRED -> The user generated unique name for the user.
    userId: '<USER_ID>',
);

if (user.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.8.4 Replace a User
PUT operation on the specific user resource to replace the entire user resource.
The only replaceable property is the id of the user. This replace operation does not impact the permissions of the user.

The user-replace operation returns a `Future<User>`.
See [3.8.6 The Trigger model](#386-the-trigger-model) for information on the returned model and its variables.
```dart
final User user = await cosmosDb.user.replace(
    // REQUIRED -> User generated name/id of the database.
    dbId: '<DB_ID>',
    // REQUIRED -> The id/name of the user to replace.
    userId: '<USER_ID>',
    // REQUIRED -> The new unique id/name of the user.
    newUserId: '<NEW_USER_ID>',
);

if (user.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.8.5 Delete a User
The delete-operation deletes an existing user in a database.

The user-delete operation returns a `Future<User>`.
See [3.8.6 The Trigger model](#386-the-trigger-model) for information on the returned model and its variables.
```dart
final User user = await cosmosDb.user.delete(
    // REQUIRED -> User generated name/id of the database.
    dbId: '<DB_ID>',
    // REQUIRED -> The id/name of the user to delete.
    userId: '<USER_ID>',
);

if (user.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.8.6 The User model
##### `User`
**Methods**
`User.toMap()` -> Transforms the model to a Map for the CosmosDB API.
`User.toMap(Map<String, dynamic> map)` -> Transforms a Map from the CosmosDB API to the model.

**Variables**
<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Azure API key name</th>
            <th>Example</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><code>id</code></td>
            <td><code>id</code></td>
            <td>myId1</td>
            <td>The unique user generated name for the resource, max 255 chars.</td>
        </tr>
        <tr>
            <td><code>rid</code></td>
            <td><code>_rid</code></td>
            <td>qicAAA==</td>
            <td>System generated property. The resource ID (_rid) is a unique identifier. It is used internally for placement of and navigation to the resource.</td>
        </tr>
        <tr>
            <td><code>ts</code></td>
            <td><code>_ts</code></td>
            <td>1446192371</td>
            <td>System generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.</td>
        </tr>
        <tr>
            <td><code>self</code></td>
            <td><code>_self</code></td>
            <td>dbs\/qicAAA==\/</td>
            <td>System generated property. It is the unique addressable URI for the resource.</td>
        </tr>
        <tr>
            <td><code>etag</code></td>
            <td><code>_etag</code></td>
            <td>00001800-...</td>
            <td>System generated property representing the resource etag required for optimistic concurrency control.</td>
        </tr>
        <tr>
            <td><code>error</code></td>
            <td><code>code</code>,<br><code>message</code></td>
            <td>{<br>"code": "...",<br>"message": "..."<br>}</td>
            <td>An empty Map in case of a successful transaction, else a map with a code and a message.</td>
        </tr>
        <tr>
            <td><code>permissions</code></td>
            <td><code>_permissions</code></td>
            <td>permissions\/</td>
            <td>System generated property denoting the addressable path of the feed of permissions resource.</td>
        </tr>
    </tbody>
</table>

##### `UserList`
**Methods**
`UserList.toMap()` -> Transforms the model to a Map for the CosmosDB API.
`UserList.toMap(Map<String, dynamic> map)` -> Transforms a Map from the CosmosDB API to the model.

**Variables**
<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Azure API key name</th>
            <th>Example</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><code>rid</code></td>
            <td><code>_rid</code></td>
            <td>qicAAA==</td>
            <td>System generated property. The resource ID (_rid) is a unique identifier. It is used internally for placement of and navigation to the resource.</td>
        </tr>
        <tr>
            <td><code>count</code></td>
            <td><code>_count</code></td>
            <td>3</td>
            <td>This property shows the number of resources returned as part of list operation.</td>
        </tr>
        <tr>
            <td><code>error</code></td>
            <td><code>code</code>,<br><code>message</code></td>
            <td>{<br>"code": "...",<br>"message": "..."<br>}</td>
            <td>An empty Map in case of a successful transaction, else a map with a code and a message.</td>
        </tr>
        <tr>
            <td><code>users</code></td>
            <td><code>Users</code></td>
            <td>[]</td>
            <td>A list of CosmosDB users. <code>List&lt;User&gt;</code></td>
        </tr>
    </tbody>
</table>

### 3.9 Permissions
Permission is an authorization token associated with a user for authorized access to a specific resource. It is used to manage access to collections, documents, attachments, stored procedures, triggers, and user-defined functions for a particular user.

#### 3.9.1 List Permissions
GET operation on the permissions URI path, which returns a list of permissions for the user.
All of the resource tokens are recreated for the respective permissions returned as part of the response.
The new tokens have the default validity period (one hour) unless it is overridden.

The permission-list operation returns a `Future<PermissionList>` with a list of  `Permission` or an error object.
See [3.9.6 The Permission model](#396-the-permission-model) for information on the returned model and its variables.
```dart
final PermissionList permissionList = await cosmosDb.permission.list(
    // REQUIRED -> User generated name/id of the database.
    dbId: '<DB_ID>',
    // REQUIRED -> Name/id of the user, the permissions are assigned to.
    userId: '<USER_ID>',
);

if (permissionList.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.9.2 Get a Permission
Performing a GET operation on a specific permission resource retrieves the permission properties, including the token, for the particular permission.
A new resource token is created every time a GET is invoked on the permission resource.
The new tokens have the default validity period (one hour) unless it is overridden.

The permission-get operation returns a `Future<Permission>`.
See [3.9.6 The Permission model](#396-the-permission-model) for information on the returned model and its variables.
```dart
final Permission permission = await cosmosDb.permission.get(
    // REQUIRED -> User generated name/id of the database.
    dbId: '<DB_ID>',
    // REQUIRED -> Name/id of the user, the permission is assigned to.
    userId: '<USER_ID>',
    // REQUIRED -> Name/id of the permission to be retrieved.
    permissionId: '<PERMISSION_ID>',
);

if (permission.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.9.3 Create a Permission
The create-operation creates a new permission in a database.

The permission-create operation returns a `Future<Permission>`.
See [3.9.6 The Permission model](#396-the-permission-model) for information on the returned model and its variables.
```dart
final Permission permission = await cosmosDb.permission.create(
    // REQUIRED -> User generated name/id of the database.
    dbId: '<DB_ID>',
    // REQUIRED -> Name/id of the user, the permission will be assigned to.
    userId: '<USER_ID>',
    // REQUIRED -> The full addressable path of the resource associated with the permission. 
    // For example, dbs/volcanodb/colls/volcano1.
    collectionId: '<COLLECTION_ID>',
    // REQUIRED -> Name/id of the permission to be created.
    permissionId: '<PERMISSION_ID>',
    // REQUIRED -> The access mode for the resource: All or Read. All provides read, write, and delete access to a resource.
    // The acceptable values are: PermissionMode.all, PermissionMode.read
    permissionMode: PermissionMode.all,
);

if (permission.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.9.4 Replace a Permission
Performing a PUT operation on a specific permission resource replaces the entire user resource.
All user-settable properties, the id, permissionMode, and resource, must be submitted in the body to perform the replacement.

The permission-replace operation returns a `Future<Permission>`.
See [3.9.6 The Permission model](#396-the-permission-model) for information on the returned model and its variables.
```dart
final Permission permission = await cosmosDb.permission.replace(
    // REQUIRED -> User generated name/id of the database.
    dbId: '<DB_ID>',
    // REQUIRED -> Name/id of the user, the permission is assigned to.
    userId: '<USER_ID>',
    // REQUIRED -> The full addressable path of the resource associated with the permission. 
    // For example, dbs/volcanodb/colls/volcano1.
    collectionId: '<COLLECTION_ID>',
    // REQUIRED -> Name/id of the permission to be replaced.
    permissionId: '<PERMISSION_ID>',
    // REQUIRED -> The new name/id of the permission.
    newPermissionId: '<NEW_PERMISSION_ID>',
    // REQUIRED -> The access mode for the resource: All or Read. All provides read, write, and delete access to a resource.
    // The acceptable values are: PermissionMode.all, PermissionMode.read
    permissionMode: PermissionMode.all,
);

if (permission.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.9.5 Delete a Permission
The delete-operation deletes an existing permission in a database.

The permission-delete operation returns a `Future<Permission>`.
See [3.9.6 The Permission model](#396-the-permission-model) for information on the returned model and its variables.
```dart
final Permission permission = await cosmosDb.permission.delete(
    // REQUIRED -> User generated name/id of the database.
    dbId: '<DB_ID>',
    // REQUIRED -> Name/id of the user, the permission is assigned to.
    userId: '<USER_ID>',
    // REQUIRED -> Name/id of the permission to be deleted.
    permissionId: '<PERMISSION_ID>',
);

if (permission.error.isEmpty) {
    // If the error is empty, continue....
}
```

#### 3.9.6 The Permission model
##### `Permission`
**Methods**
`Permission.toMap()` -> Transforms the model to a Map for the CosmosDB API.
`Permission.toMap(Map<String, dynamic> map)` -> Transforms a Map from the CosmosDB API to the model.

**Variables**
<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Azure API key name</th>
            <th>Example</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><code>id</code></td>
            <td><code>id</code></td>
            <td>myId1</td>
            <td>The unique user generated name for the resource, max 255 chars.</td>
        </tr>
        <tr>
            <td><code>rid</code></td>
            <td><code>_rid</code></td>
            <td>qicAAA==</td>
            <td>System generated property. The resource ID (_rid) is a unique identifier. It is used internally for placement of and navigation to the resource.</td>
        </tr>
        <tr>
            <td><code>ts</code></td>
            <td><code>_ts</code></td>
            <td>1446192371</td>
            <td>System generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.</td>
        </tr>
        <tr>
            <td><code>self</code></td>
            <td><code>_self</code></td>
            <td>dbs\/qicAAA==\/</td>
            <td>System generated property. It is the unique addressable URI for the resource.</td>
        </tr>
        <tr>
            <td><code>etag</code></td>
            <td><code>_etag</code></td>
            <td>00001800-...</td>
            <td>System generated property representing the resource etag required for optimistic concurrency control.</td>
        </tr>
        <tr>
            <td><code>error</code></td>
            <td><code>code</code>,<br><code>message</code></td>
            <td>{<br>"code": "...",<br>"message": "..."<br>}</td>
            <td>An empty Map in case of a successful transaction, else a map with a code and a message.</td>
        </tr>
        <tr>
            <td><code>token</code></td>
            <td><code>_token</code></td>
            <td>type=resource&ver=1&sig=m32...</td>
            <td>System generated resource token for the particular resource and user.</td>
        </tr>
        <tr>
            <td><code>permissionMode</code></td>
            <td><code>permissionMode</code></td>
            <td>PermissionMode.all</td>
            <td>The access mode on the resource for the user: PermissionMode.all or PermissionMode.read.<br>All provides read, write, and delete access to a resource.</td>
        </tr>
        <tr>
            <td><code>resource</code></td>
            <td><code>resource</code></td>
            <td>dbs/ruJjAA==/colls/ruJjAM9UnAA=/</td>
            <td>The full addressable path of the resource associated with the permission.</td>
        </tr>
    </tbody>
</table>

##### `PermissionList`
**Methods**
`PermissionList.toMap()` -> Transforms the model to a Map for the CosmosDB API.
`PermissionList.toMap(Map<String, dynamic> map)` -> Transforms a Map from the CosmosDB API to the model.

**Variables**
<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Azure API key name</th>
            <th>Example</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><code>rid</code></td>
            <td><code>_rid</code></td>
            <td>qicAAA==</td>
            <td>System generated property. The resource ID (_rid) is a unique identifier. It is used internally for placement of and navigation to the resource.</td>
        </tr>
        <tr>
            <td><code>count</code></td>
            <td><code>_count</code></td>
            <td>3</td>
            <td>This property shows the number of resources returned as part of list operation.</td>
        </tr>
        <tr>
            <td><code>error</code></td>
            <td><code>code</code>,<br><code>message</code></td>
            <td>{<br>"code": "...",<br>"message": "..."<br>}</td>
            <td>An empty Map in case of a successful transaction, else a map with a code and a message.</td>
        </tr>
        <tr>
            <td><code>permissions</code></td>
            <td><code>Permissions</code></td>
            <td>[]</td>
            <td>A list of CosmosDB permissions. <code>List&lt;Permission&gt;</code></td>
        </tr>
    </tbody>
</table>

## 4 Where to go from here

## 5 Bugs and issues
Please file feature requests and bugs at the [issue tracker](https://github.com/Pat992/dart_azure_cosmosdb/issues)