// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/base_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_model.dart';

/// A list of CosmosDB collections.
class CollectionList extends BaseList {
  /// **Description:** A list of CosmosDB collections.
  ///
  /// **Example:** [[]]
  List<Collection> collections = [];

  /// **Description:** Creates a [CollectionList] model Object.
  ///
  /// **collections:** A list of CosmosDB collections.
  ///
  /// [Type:] List<Collection> *optional*
  ///
  /// [Default value:] const [[]]
  CollectionList({
    this.collections = const [],
  }) : super(
          error: const {},
          rid: '',
          count: 0,
        );

  /// **Description:** Transforms the [CollectionList] model to a Map for the CosmosDB API.
  @override
  Map<String, dynamic> toMap() {
    var body = super.toMap();

    if (error.isEmpty) {
      body.addAll({
        'DocumentCollections':
            collections.map((collection) => collection.toMap()).toList()
      });
    }

    return body;
  }

  /// **Description:** Transforms a Map from the CosmosDB API to the [CollectionList] model.
  @override
  CollectionList.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    if (map.containsKey('DocumentCollections')) {
      for (final collection in map['DocumentCollections']) {
        collections.add(Collection.fromMap(collection));
      }
    }
  }
}
