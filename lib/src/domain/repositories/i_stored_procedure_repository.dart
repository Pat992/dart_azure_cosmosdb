// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/models_barrel.dart';

/// A stored procedure is a piece of application logic written in JavaScript that is registered and executed against a collection as a single transaction.
/// In Azure Cosmos DB, JavaScript is hosted in the same memory space as the database.
/// Hence, requests made within stored procedures execute in the same scope of a database session.
/// This process enables Azure Cosmos DB to guarantee ACID for all operations that are part of a single stored procedure.
abstract class IStoredProcedureRepository {
  /// **Description:** Performing a GET on the stored procedures resource of a particular database, that is,
  /// the sprocs URI path, returns a list of the stored procedures in the collection.
  ///
  /// **dbId:** User generated name/id of the database.
  ///
  /// [Type:] String *required*
  ///
  /// **collectionId:** Name of the collection where the stored procedures reside.
  ///
  /// [Type:] String *required*
  Future<StoredProcedureList> list({
    required String dbId,
    required String collectionId,
  });

  /// **Description:** The create-operation creates a new stored procedure in a collection.
  ///
  /// **dbId:** User generated name/id of the database.
  ///
  /// [Type:] String *required*
  ///
  /// **collectionId:** Name of the collection where the stored procedures is created.
  ///
  /// [Type:] String *required*
  ///
  /// **storedProcedureId:** The user generated unique name for the stored procedure.
  /// No two stored procedures can have the same IDs.
  /// It is a string that must not be more than 255 characters.
  ///
  /// [Type:] String *required*
  ///
  /// **function:** The body of the stored procedure as a String.
  ///
  /// [Type:] String *required*
  Future<StoredProcedure> create({
    required String dbId,
    required String collectionId,
    required String storedProcedureId,
    required String function,
  });

  /// **Description:** Replaces the entire stored procedure resource.
  /// All user settable properties, including the ID and the body, must be submitted in the body to perform the replacement.
  ///
  /// **dbId:** User generated name/id of the database.
  ///
  /// [Type:] String *required*
  ///
  /// **collectionId:** Name of the collection where the stored procedures is replaced.
  ///
  /// [Type:] String *required*
  ///
  /// **storedProcedureId:** The user generated unique name for the existing stored procedure.
  /// No two stored procedures can have the same IDs.
  /// It is a string that must not be more than 255 characters.
  ///
  /// [Type:] String *required*
  ///
  /// **function:** The body of the stored procedure as a String, will replace the current function.
  ///
  /// [Type:] String *required*
  Future<StoredProcedure> replace({
    required String dbId,
    required String collectionId,
    required String storedProcedureId,
    required String function,
  });

  /// **Description:** The delete-operation deletes an existing stored procedure in a collection.
  ///
  /// **dbId:** User generated name/id of the database.
  ///
  /// [Type:] String *required*
  ///
  /// **collectionId:** Name of the collection where the stored procedures is deleted from.
  ///
  /// [Type:] String *required*
  ///
  /// **storedProcedureId:** The user generated unique name for the existing stored procedure.
  ///
  /// [Type:] String *required*
  Future<StoredProcedure> delete({
    required String dbId,
    required String collectionId,
    required String storedProcedureId,
  });

  /// **Description:** Execute a stored procedure by performing a POST on a stored procedure resource.
  /// A stored procedure is a piece of application logic written in JavaScript that is registered and executed against a collection as a single transaction.
  ///
  /// **dbId:** User generated name/id of the database.
  ///
  /// [Type:] String *required*
  ///
  /// **collectionId:** Name of the collection where the stored procedures resides.
  ///
  /// [Type:] String *required*
  ///
  /// **storedProcedureId:** The user generated unique name for the existing stored procedure.
  ///
  /// [Type:] String *required*
  ///
  /// **parameters:** An array of the parameters to pass to the stored procedure.
  ///
  /// [Type:] List<dynamic> *required*
  Future<Map<String, dynamic>> execute({
    required String dbId,
    required String collectionId,
    required String storedProcedureId,
    required List<dynamic> parameters,
  });
}
