// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/base_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/trigger_model.dart';

/// A list of CosmosDB triggers.
class TriggerList extends BaseList {
  /// **Description:** A list of CosmosDB triggers.
  ///
  /// **Example:** [[]]
  List<Trigger> triggers = [];

  /// **Description:** Creates a [TriggerList] model Object.
  ///
  /// **triggers:** A list of CosmosDB triggers.
  ///
  /// [Type:] List<Trigger> *optional*
  ///
  /// [Default value:] const [[]]
  TriggerList({
    this.triggers = const [],
  }) : super(
          error: const {},
          rid: '',
          count: 0,
        );

  /// **Description:** Transforms the [TriggerList] model to a Map for the CosmosDB API.
  @override
  Map<String, dynamic> toMap() {
    var body = super.toMap();

    if (error.isEmpty) {
      body.addAll(
          {'Triggers': triggers.map((trigger) => trigger.toMap()).toList()});
    }

    return body;
  }

  /// **Description:** Transforms a Map from the CosmosDB API to the [TriggerList] model.
  @override
  TriggerList.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    if (map.containsKey('Triggers')) {
      for (final trigger in map['Triggers']) {
        triggers.add(Trigger.fromMap(trigger));
      }
    }
  }
}
