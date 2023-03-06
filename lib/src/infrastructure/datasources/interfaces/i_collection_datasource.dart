// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

/// Datasource to send requests to the Azure CosmosDB SQL api,
/// responsible for collections.
abstract class ICollectionDatasource {
  /// **Description:** Lists all the existing collections.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the collections are located.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> list({
    required String dbId,
  });

  /// **Description:** Gets a single collection by its id.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the collection is located.
  ///
  /// String collectionId - Id of the collection to get.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> get({
    required String dbId,
    required String collectionId,
  });

  /// **Description:** Creates a new collection.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the collection is located.
  ///
  /// String collectionId - Id of the collection to get.
  ///
  /// String partitionKey - Partition-key of the collection, can also be /id
  ///
  /// int version - An optional field, if not specified the default value is 1. To use the large partition key, set the version to 2.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> create({
    required String dbId,
    required String collectionId,
    required String partitionKey,
    required int version,
  });

  /// **Description:** Deletes an existing collection.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the collection is located.
  ///
  /// String collectionId - Id of the collection to delete.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> delete({
    required String dbId,
    required String collectionId,
  });
}
