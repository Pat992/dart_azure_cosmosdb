// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

/// With unique keys, you make sure that one or more values within a logical partition is unique.
/// You also can guarantee uniqueness per partition key.
class UniqueKeyPolicy {
  /// **Description:** List of keys that must have unique values in one collection, is an empty array on default.
  ///
  /// **Example:** [[]]
  List<dynamic> uniqueKeys;

  /// **Description:** Creates a [UniqueKeyPolicy] model Object.
  ///
  /// **uniqueKeys:** List of keys that must have unique values in one collection, is an empty array on default.
  ///
  /// [Type:] String *required*
  UniqueKeyPolicy({
    this.uniqueKeys = const [],
  });

  /// **Description:** Transforms the [UniqueKeyPolicy] model to a Map for the CosmosDB API.
  Map<String, dynamic> toMap() {
    if (uniqueKeys.isEmpty) {
      return {
        'uniqueKeys': [],
      };
    }
    return {
      'uniqueKeys': uniqueKeys,
    };
  }

  /// **Description:** Transforms a Map from the CosmosDB API to the [UniqueKeyPolicy] model.
  UniqueKeyPolicy.fromMap(Map<String, dynamic> map)
      : uniqueKeys = map['uniqueKeys'] ?? [];
}
