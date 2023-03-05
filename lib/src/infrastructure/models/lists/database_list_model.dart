// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/base_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/database_model.dart';

/// A list of CosmosDB databases.
class CosmosDatabaseList extends BaseList {
  /// **Description:** A list of CosmosDB databases.
  ///
  /// **Example:** [[]]
  List<CosmosDatabase> databases = [];

  /// **Description:** Creates a [CosmosDatabaseList] model Object.
  ///
  /// **databases:** A list of CosmosDB databases.
  ///
  /// [Type:] List<CosmosDatabase> *optional*
  ///
  /// [Default value:] const [[]]
  CosmosDatabaseList({
    this.databases = const [],
  }) : super(
          error: const {},
          rid: '',
          count: 0,
        );

  /// **Description:** Transforms the [CosmosDatabaseList] model to a Map for the CosmosDB API.
  @override
  Map<String, dynamic> toMap() {
    var body = super.toMap();

    if (error.isEmpty) {
      body.addAll({'Databases': databases.map((db) => db.toMap()).toList()});
    }

    return body;
  }

  /// **Description:** Transforms a Map from the CosmosDB API to the [CosmosDatabaseList] model.
  @override
  CosmosDatabaseList.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    if (map.containsKey('Databases')) {
      for (final db in map['Databases']) {
        databases.add(CosmosDatabase.fromMap(db));
      }
    }
  }
}
