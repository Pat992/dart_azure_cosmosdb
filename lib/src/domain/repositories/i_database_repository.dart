// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/models_barrel.dart';

/// A database is a logical namespace for collections, users, and permissions.
abstract class IDatabaseRepository {
  /// **Description:** List the databases under the database account, perform a GET on the databases resource.
  Future<CosmosDatabaseList> list();

  /// **Description:** Retrieve a database resource, perform a GET on the database resource.
  ///
  /// **dbId:** User generated name/id of the database in which the collections are saved.
  ///
  /// [Type:] String *required*
  Future<CosmosDatabase> get({
    required String dbId,
  });

  /// **Description:** The create-operation creates a new database in the database account.
  ///
  /// **dbId:** User generated name/id of the database in which the collections are saved.
  ///
  /// [Type:] String *required*
  Future<CosmosDatabase> create({
    required String dbId,
  });

  /// **Description:** The delete-operation deletes an existing database in the database account.
  ///
  /// **dbId:** User generated name/id of the database to be deleted.
  ///
  /// [Type:] String *required*
  Future<CosmosDatabase> delete({
    required String dbId,
  });
}
