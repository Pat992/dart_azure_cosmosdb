// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

/// Datasource to send requests to the Azure CosmosDB SQL api,
/// responsible for stored procedures.
abstract class IStoredProcedureDatasource {
  /// **Description:** Lists all the stored procedures in a collection.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the collection is located.
  ///
  /// String collectionId - Collection in which the stored procedures are located.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> list({
    required String dbId,
    required String collectionId,
  });

  /// **Description:** Create a new stored procedures in a collection.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the the collection is located.
  ///
  /// String collectionId - Collection in which the the stored procedure will be located.
  ///
  /// String storedProcedureId - Id of the stored procedure.
  ///
  /// String function - The function of the stored-procedure.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> create({
    required String dbId,
    required String collectionId,
    required String storedProcedureId,
    required String function,
  });

  /// **Description:** Replace an existing stored procedures in a collection.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the the collection is located.
  ///
  /// String collectionId - Collection in which the the stored procedure is located.
  ///
  /// String storedProcedureId - Id of the existing stored procedure.
  ///
  /// String function - The function of the stored-procedure, will replace the existing one.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> replace({
    required String dbId,
    required String collectionId,
    required String storedProcedureId,
    required String function,
  });

  /// **Description:** Delete an existing stored procedures in a collection.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the the collection is located.
  ///
  /// String collectionId - Collection in which the the stored procedure is located.
  ///
  /// String storedProcedureId - Id of the existing stored procedure.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> delete({
    required String dbId,
    required String collectionId,
    required String storedProcedureId,
  });

  /// **Description:** Execute an existing stored procedures in a collection.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the the collection is located.
  ///
  /// String collectionId - Collection in which the the stored procedure is located.
  ///
  /// String storedProcedureId - Id of the existing stored procedure.
  ///
  /// List<dynamic> parameters - Parameters for the stored procedure.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> execute({
    required String dbId,
    required String collectionId,
    required String storedProcedureId,
    required List<dynamic> parameters,
  });
}
