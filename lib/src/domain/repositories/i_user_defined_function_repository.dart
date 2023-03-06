// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/models_barrel.dart';

/// A user-defined function (UDF) is a side effect free piece of application logic written in JavaScript.
/// It allows developers to construct a query operator, thus extending the core of the Cosmos DB query language.
/// Like stored procedures, UDFs live in the confines of a collection, thus confining the application logic to the collection.
abstract class IUserDefinedFunctionRepository {
  /// **Description:** Performing a GET on the triggers resource of a particular database returns a list of the triggers in the collection.
  ///
  /// **dbId:** User generated name/id of the database.
  ///
  /// [Type:] String *required*
  ///
  /// **collectionId:** Id/name of the collection where the user defined functions reside.
  ///
  /// [Type:] String *required*
  Future<UserDefinedFunctionList> list({
    required String dbId,
    required String collectionId,
  });

  /// **Description:** The create-operation creates a new stored procedure in a collection.
  ///
  /// **dbId:** User generated name/id of the database.
  ///
  /// [Type:] String *required*
  ///
  /// **collectionId:** Id/name of the collection where the user defined function is created.
  ///
  /// [Type:] String *required*
  ///
  /// **userDefinedFunctionId:** Unique name to identify the user defined function.
  /// The id must not exceed 255 characters.
  ///
  /// [Type:] String *required*
  ///
  /// **function:** The body of the user defined function.
  ///
  /// [Type:] String *required*
  Future<UserDefinedFunction> create({
    required String dbId,
    required String collectionId,
    required String userDefinedFunctionId,
    required String function,
  });

  /// **Description:** Performing a PUT operation on a specific UDF resource replaces the entire UDF resource.
  /// All user-settable properties, including the id and the body, must be submitted in the body to perform the replacement.
  ///
  /// **dbId:** User generated name/id of the database.
  ///
  /// [Type:] String *required*
  ///
  /// **collectionId:** Id/name of the collection where the user defined function is replaced.
  ///
  /// [Type:] String *required*
  ///
  /// **userDefinedFunctionId:** Id/name of the user defined function to be replaced.
  ///
  /// [Type:] String *required*
  ///
  /// **function:** The body of the user defined function, will replace the current function.
  ///
  /// [Type:] String *required*
  Future<UserDefinedFunction> replace({
    required String dbId,
    required String collectionId,
    required String userDefinedFunctionId,
    required String function,
  });

  /// **Description:** The delete-operation deletes an existing user-defined function in a collection.
  ///
  /// **dbId:** User generated name/id of the database.
  ///
  /// [Type:] String *required*
  ///
  /// **collectionId:** Id/name of the collection where the user defined function is deleted from.
  ///
  /// [Type:] String *required*
  ///
  /// **userDefinedFunctionId:** Id/name of the user defined function to be deleted.
  ///
  /// [Type:] String *required*
  Future<UserDefinedFunction> delete({
    required String dbId,
    required String collectionId,
    required String userDefinedFunctionId,
  });
}
