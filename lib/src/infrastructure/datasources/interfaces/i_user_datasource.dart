// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

/// Datasource to send requests to the Azure CosmosDB SQL api,
/// responsible for users.
abstract class IUserDatasource {
  /// **Description:** Lists all the users in a database.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the users are located.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> list({
    required String dbId,
  });

  /// **Description:** Get an existing user in a database.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the users are located.
  ///
  /// String userId - Id of an existing user.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> get({
    required String dbId,
    required String userId,
  });

  /// **Description:** Create a user in a database.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the users is to be located.
  ///
  /// String userId - Id of the user.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> create({
    required String dbId,
    required String userId,
  });

  /// **Description:** Replace the id of an existing user in a database.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the users is to be located.
  ///
  /// String userId - The current id of the user.
  ///
  /// String newUserId - The new id of the user.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> replace({
    required String dbId,
    required String userId,
    required String newUserId,
  });

  /// **Description:** Delete an existing user in a database.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the users is to be located.
  ///
  /// String userId - The id of the user.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> delete({
    required String dbId,
    required String userId,
  });
}
