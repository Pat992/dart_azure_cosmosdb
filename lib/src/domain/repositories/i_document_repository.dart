// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/models_barrel.dart';

/// The document resource is represented by docs in the Azure Cosmos DB resource model.
/// A document consists of user-defined content in JSON format.
/// Aside from the required ID property, users can define any arbitrary elements, structures, and hierarchies for the content.
/// The ID element is a unique string that is user-settable and must not exceed 255 characters. You can insert, replace, delete, read, enumerate, and query arbitrary JSON documents in a collection.
abstract class IDocumentRepository {
  /// **Description:** Performing a GET on the documents resource of a particular collection, i.e. the docs URI path, returns a list of documents under the collection.
  ///
  /// **dbId:** User generated name/id of the database.
  ///
  /// [Type:] String *required*
  ///
  /// **collectionId:** Id/name of the collection.
  ///
  /// [Type:] String *required*
  Future<CosmosDocumentList> list({
    required String dbId,
    required String collectionId,
  });

  /// **Description:** The get-operation retrieves a document by its partition key and document key.
  ///
  /// **dbId:** User generated name/id of the database.
  ///
  /// [Type:] String *required*
  ///
  /// **collectionId:** Id/name of the collection.
  ///
  /// [Type:] String *required*
  ///
  /// **documentId:** Id of the document to be retrieved.
  ///
  /// [Type:] String *required*
  ///
  /// **partitionKey:** Partition key value for the document to be received.
  /// Must be included if and only if the collection is created with a partitionKey definition.
  ///
  /// [Type:] String *required*
  Future<CosmosDocument> get({
    required String dbId,
    required String collectionId,
    required String documentId,
    required String partitionKey,
  });

  /// **Description:** The create-operation creates a new document in a collection.
  ///
  /// **dbId:** User generated name/id of the database.
  ///
  /// [Type:] String *required*
  ///
  /// **collectionId:** Id/name of the collection.
  ///
  /// [Type:] String *required*
  ///
  /// **partitionKey:** Partition key value for the document to be created.
  /// Must be included if and only if the collection is created with a partitionKey definition.
  ///
  /// [Type:] String *required*
  ///
  /// **body:** Any map with Strings as keys and dynamic values that will be added to the document.
  ///
  /// [Type:] Map<String, dynamic> *required*
  Future<CosmosDocument> create({
    required String dbId,
    required String collectionId,
    required String partitionKey,
    required Map<String, dynamic> body,
  });

  /// **Description:** The delete-operation deletes an existing document in a collection.
  ///
  /// **dbId:** User generated name/id of the database.
  ///
  /// [Type:] String *required*
  ///
  /// **collectionId:** Id/name of the collection.
  ///
  /// [Type:] String *required*
  ///
  /// **documentId:** Id of the document to be deleted.
  ///
  /// [Type:] String *required*
  ///
  /// **partitionKey:** Partition key value for the document to be deleted.
  /// Must be included if and only if the collection is created with a partitionKey definition.
  ///
  /// [Type:] String *required*
  Future<CosmosDocument> delete({
    required String dbId,
    required String collectionId,
    required String documentId,
    required String partitionKey,
  });

  /// **Description:** The replace-operation replaces the entire content of a document.
  ///
  /// **dbId:** User generated name/id of the database.
  ///
  /// [Type:] String *required*
  ///
  /// **collectionId:** Id/name of the collection.
  ///
  /// [Type:] String *required*
  ///
  /// **documentId:** Id of the document to be replaced.
  ///
  /// [Type:] String *required*
  ///
  /// **partitionKey:** Partition key value for the document to be replaced.
  /// Must be included if and only if the collection is created with a partitionKey definition.
  ///
  /// [Type:] String *required*
  ///
  /// **body:** Any map with Strings as keys and dynamic values that will replace the current values.
  ///
  /// [Type:] Map<String, dynamic> *required*
  Future<CosmosDocument> replace({
    required String dbId,
    required String collectionId,
    required String documentId,
    required String partitionKey,
    required Map<String, dynamic> body,
  });

  /// **Description:** You can query arbitrary json documents in a collection by performing a post against the “colls” resource in Cosmos DB.
  /// The sql syntax of Cosmos DB provides hierarchical, relational, and spatial query operators to query and project documents.
  ///
  /// **dbId:** User generated name/id of the database.
  ///
  /// [Type:] String *required*
  ///
  /// **collectionId:** Id/name of the collection.
  ///
  /// [Type:] String *required*
  ///
  /// **query:** Contains the SQL query text.
  ///
  /// [Type:] String *required*
  ///
  /// **parameters:** An array of parameter values for the query, optional if query does not include parameters.
  ///
  /// [Type:] String *optional*
  ///
  /// [Default:] const [[]]
  Future<CosmosDocumentList> query({
    required String dbId,
    required String collectionId,
    required String query,
    List<dynamic> parameters = const [],
  });
}
