// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/models_barrel.dart';

/// The REST API supports basic CRUD operations on the resources under a database account.
/// A collection is a container of JSON documents and associated JavaScript application logic, i.e. stored procedures, triggers and user-defined functions.
/// This topic outlines the REST operations used to manage document collections.
abstract class ICollectionRepository {
  /// **Description:** Performing a GET on the collections resource of a particular database, i.e. the colls URI path, returns a list of the collections in the database.
  ///
  /// **dbId:** User generated name/id of the database in which the collections are saved.
  ///
  /// [Type:] String *required*
  Future<CollectionList> list({
    required String dbId,
  });

  /// **Description:** Performing a GET on a specific collection resource retrieves the properties for the collection.
  ///
  /// **dbId:** User generated name/id of the database in which the collection is saved.
  ///
  /// [Type:] String *required*
  ///
  /// **collectionId:** Name of the existing collection.
  ///
  /// [Type:] String *required*
  Future<Collection> get({
    required String dbId,
    required String collectionId,
  });

  /// **Description:** The create-operation creates a new collection in a database.
  ///
  /// **dbId:** User generated name/id of the database in which the collection is created.
  ///
  /// [Type:] String *required*
  ///
  /// **collectionId:** Name of the collection to be created.
  ///
  /// [Type:] String *required*
  ///
  /// **partitionKey:** The partition key to be used for partitioning data into multiple partitions.
  /// Can be '/id' or a different value.
  ///
  /// [Type:] String *required*
  ///
  /// **version:** Set this value to 2, to use a large partition key, else set it to 1.
  ///
  /// [Type:] int *required*
  Future<Collection> create({
    required String dbId,
    required String collectionId,
    required String partitionKey,
    required int version,
  });

  /// **Description:** The delete-operation deletes an existing collection in a database.
  ///
  /// **dbId:** User generated name/id of the database in which the collection is located.
  ///
  /// [Type:] String *required*
  ///
  /// **collectionId:** Name of the collection to be deleted.
  ///
  /// [Type:] String *required*
  Future<Collection> delete({
    required String dbId,
    required String collectionId,
  });
}
