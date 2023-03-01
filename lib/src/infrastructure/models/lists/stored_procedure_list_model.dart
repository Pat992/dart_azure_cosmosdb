// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/base_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/stored_procedure_model.dart';

class StoredProcedureList extends BaseList {
  List<StoredProcedure> storedProcedures = [];

  StoredProcedureList({
    this.storedProcedures = const [],
    super.error = const {},
    super.rid = '',
    super.count = 0,
  });

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

  @override
  StoredProcedureList.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    if (map.containsKey('StoredProcedures')) {
      for (final storedProcedure in map['StoredProcedures']) {
        storedProcedures.add(StoredProcedure.fromMap(storedProcedure));
      }
    }
  }
}
