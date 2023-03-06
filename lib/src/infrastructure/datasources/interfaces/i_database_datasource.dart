// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

/// Datasource to send requests to the Azure CosmosDB SQL api,
/// responsible for databases.
abstract class IDatabaseDatasource {
  /// **Description:** Lists all the existing databases.
  ///
  /// **Parameter:** none
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> list();

  Future<Map<String, dynamic>> get({
    required String dbId,
  });

  /// **Description:** Gets a single database by its id.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Id of the database to get.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> create({
    required String dbId,
  });

  /// **Description:** Deletes an existing database.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Id of the database to delete.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> delete({
    required String dbId,
  });
}
