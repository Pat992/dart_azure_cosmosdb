// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_sub_models/index_model.dart';

/// Model for included and excluded paths.
class Path {
  /// **Description:** Path for which the indexing behavior applies to. Index paths start with the root (/) and typically end with the ? wildcard operator, denoting that there are multiple possible values for the prefix.
  /// For example, to serve SELECT * FROM Families F WHERE F.familyName = "Andersen", you must include an index path for /familyName/? in the collection’s index policy.
  ///
  /// **Example:** '/AccountNumber'
  String path;

  /// **Description:** The array containing document paths to be indexed.
  /// By default, two paths are included: the / path, which specifies that all document paths be indexed, and the _ts path, which indexes for a timestamp range comparison.
  ///
  /// **Example:** [[]]
  List<PathIndex> indexes = [];

  /// **Description:** Creates a [Path] model Object.
  ///
  /// **path:** **Description:** Path for which the indexing behavior applies to. Index paths start with the root (/) and typically end with the ? wildcard operator, denoting that there are multiple possible values for the prefix.
  /// For example, to serve SELECT * FROM Families F WHERE F.familyName = "Andersen", you must include an index path for /familyName/? in the collection’s index policy.
  ///
  /// [Type:] String *required*
  ///
  /// **indexes:** The array containing document paths to be indexed.
  /// By default, two paths are included: the / path, which specifies that all document paths be indexed, and the _ts path, which indexes for a timestamp range comparison.
  ///
  /// [Type:] List<PathIndex> *optional*
  ///
  /// [Default value:] const [[]]
  Path({
    required this.path,
    this.indexes = const [],
  });

  /// **Description:** Transforms the [Path] model to a Map for the CosmosDB API.
  Map<String, dynamic> toMap() {
    return {
      'path': path,
      'indexes': indexes.map((index) => index.toMap()).toList(),
    };
  }

  /// **Description:** Transforms a Map from the CosmosDB API to the [Path] model.
  Path.fromMap(Map<String, dynamic> map) : path = map['path'] ?? '' {
    if (map.containsKey('indexes')) {
      for (final index in map['indexes']) {
        indexes.add(PathIndex.fromMap(index));
      }
    }
  }
}
