// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

/// Datasource to send requests to the Azure CosmosDB SQL api,
/// responsible for user defined functions.
abstract class IUserDefinedFunctionDatasource {
  /// **Description:** Lists all the user defined functions in a collection.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the collection is located.
  ///
  /// String collectionId - Collection in which the the user defined functions are located.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> list({
    required String dbId,
    required String collectionId,
  });

  /// **Description:** Create a new user defined function in a collection.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the the collection is located.
  ///
  /// String collectionId - Collection in which the the user defined function will be located.
  ///
  /// String userDefinedFunctionId - Id of the user defined function.
  ///
  /// String function - The function of the user defined function.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> create({
    required String dbId,
    required String collectionId,
    required String userDefinedFunctionId,
    required String function,
  });

  /// **Description:** Replace an existing user defined function in a collection.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the the collection is located.
  ///
  /// String collectionId - Collection in which the the user defined function is.
  ///
  /// String userDefinedFunctionId - Id of the user defined function.
  ///
  /// String function - The function of the user defined function.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> replace({
    required String dbId,
    required String collectionId,
    required String userDefinedFunctionId,
    required String function,
  });

  /// **Description:** Delete an existing user defined function in a collection.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the the collection is located.
  ///
  /// String collectionId - Collection in which the the user defined function is.
  ///
  /// String userDefinedFunctionId - Id of the user defined function.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> delete({
    required String dbId,
    required String collectionId,
    required String userDefinedFunctionId,
  });
}
