// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/base_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/stored_procedure_model.dart';

/// A list of CosmosDB stored procedures.
class StoredProcedureList extends BaseList {
  /// **Description:** A list of CosmosDB stored procedures.
  ///
  /// **Example:** [[]]
  List<StoredProcedure> storedProcedures = [];

  /// **Description:** Creates a [StoredProcedureList] model Object.
  ///
  /// **storedProcedures:** A list of CosmosDB stored procedures.
  ///
  /// [Type:] List<StoredProcedure> *optional*
  ///
  /// [Default value:] const [[]]
  StoredProcedureList({
    this.storedProcedures = const [],
  }) : super(
          error: const {},
          rid: '',
          count: 0,
        );

  /// **Description:** Transforms the [StoredProcedureList] model to a Map for the CosmosDB API.
  @override
  Map<String, dynamic> toMap() {
    var body = super.toMap();

    if (error.isEmpty) {
      body.addAll({
        'StoredProcedures': storedProcedures
            .map((storedProcedure) => storedProcedure.toMap())
            .toList()
      });
    }

    return body;
  }

  /// **Description:** Transforms a Map from the CosmosDB API to the [StoredProcedureList] model.
  @override
  StoredProcedureList.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    if (map.containsKey('StoredProcedures')) {
      for (final storedProcedure in map['StoredProcedures']) {
        storedProcedures.add(StoredProcedure.fromMap(storedProcedure));
      }
    }
  }
}
