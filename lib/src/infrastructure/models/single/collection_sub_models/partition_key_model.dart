// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

/// This value is used to configure the partition key to be used for partitioning data into multiple partitions.
class PartitionKey {
  /// **Description:** An array of paths using which data within the collection can be partitioned.
  /// Paths must not contain a wildcard or a trailing slash. For example, the JSON property “AccountNumber” is specified as “/AccountNumber”.
  /// The array must contain only a single value.
  ///
  /// **Example:** [['/id']]
  List<dynamic> paths = [];

  /// **Description:** The algorithm used for partitioning. Only Hash is supported.
  ///
  /// **Example:** 'Hash'
  String kind = 'Hash';

  /// **Description:** An optional field, if not specified the default value is 1. To use the large partition key, set the version to 2.
  ///
  /// **Example:** 1
  int version;

  /// **Description:** Creates a [PartitionKey] model Object.
  ///
  /// **paths:** An array of paths using which data within the collection can be partitioned.
  /// Paths must not contain a wildcard or a trailing slash. For example, the JSON property “AccountNumber” is specified as “/AccountNumber”.
  /// The array must contain only a single value.
  ///
  /// [Type:] List<String> *required*
  ///
  /// **version:** An optional field, if not specified the default value is 1. To use the large partition key, set the version to 2.
  ///
  /// [Type:] int *optional*
  ///
  /// [Default value:] 1
  PartitionKey({
    required this.paths,
    this.version = 1,
  });

  /// **Description:** Transforms the [PartitionKey] model to a Map for the CosmosDB API.
  Map<String, dynamic> toMap() {
    return {
      'paths': paths,
      'kind': kind,
      'version': version,
    };
  }

  /// **Description:** Transforms a Map from the CosmosDB API to the [PartitionKey] model.
  PartitionKey.fromMap(Map<String, dynamic> map)
      : paths = map['paths'] ?? [],
        kind = map['kind'] ?? '',
        version = map['version'] ?? 1;
}
