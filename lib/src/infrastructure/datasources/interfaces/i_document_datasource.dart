// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

/// Datasource to send requests to the Azure CosmosDB SQL api,
/// responsible for documents.
abstract class IDocumentDatasource {
  /// **Description:** Lists all the existing documents.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the documents are located.
  ///
  /// String collectionId - Collection in which the documents are located.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> list({
    required String dbId,
    required String collectionId,
  });

  /// **Description:** Get an existing document by its id and partition key.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the document is located.
  ///
  /// String collectionId - Collection in which the document is located.
  ///
  /// String documentId - Id of the document to get.
  ///
  /// String partitionKey - Partition key of the document to get.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> get({
    required String dbId,
    required String collectionId,
    required String documentId,
    required String partitionKey,
  });

  /// **Description:** Create a new document.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the document will be created.
  ///
  /// String collectionId - Collection in which the document will be created.
  ///
  /// String partitionKey - Partition key of the document.
  ///
  /// Map<String, dynamic> - Body with key-values that need to be saved in the document.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> create({
    required String dbId,
    required String collectionId,
    required String partitionKey,
    required Map<String, dynamic> body,
  });

  /// **Description:** Delete an existing document.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the document is located.
  ///
  /// String collectionId - Collection in which the document is located.
  ///
  /// String documentId - Id of the document.
  ///
  /// String partitionKey - Partition key of the document.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> delete({
    required String dbId,
    required String collectionId,
    required String documentId,
    required String partitionKey,
  });

  /// **Description:** Replace an existing document
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the document is located.
  ///
  /// String collectionId - Collection in which the document is located.
  ///
  /// String documentId - Id of the document.
  ///
  /// String partitionKey - Partition key of the document.
  ///
  /// Map<String, dynamic> - Body with key-values that will replace the current values in the document.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> replace({
    required String dbId,
    required String collectionId,
    required String documentId,
    required String partitionKey,
    required Map<String, dynamic> body,
  });

  /// **Description:** Query through the documents.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the document is located.
  ///
  /// String collectionId - Collection in which the document is located.
  ///
  /// String query - Query to be executed.
  ///
  /// List<dynamic> parameters - Additional parameters, if query expects them.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> query({
    required String dbId,
    required String collectionId,
    required String query,
    List<dynamic> parameters = const [],
  });
}
