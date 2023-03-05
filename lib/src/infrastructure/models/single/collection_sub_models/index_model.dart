// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

/// Part of the indexing policy/included and excluded paths
class PathIndex {
  /// **Description:** The type of index.
  /// Hash indexes are useful for equality comparisons while Range indexes are useful for equality, range comparisons and sorting.
  /// Spatial indexes are useful for spatial queries.
  ///
  /// **Example:** 'Hash'
  String kind;

  /// **Description:** It is the datatype for which the indexing behavior is applied to.
  /// Can be String, Number, Point, Polygon, or LineString. Booleans and nulls are automatically indexed
  ///
  /// **Example:** 'Number'
  String dataType;

  /// **Description:** The precision of the index. Can be either set to -1 for maximum precision or between 1-8 for Number, and 1-100 for String.
  /// Not applicable for Point, Polygon, and LineString data types.
  ///
  /// **Example:** -1
  int precision;

  /// **Description:** Creates a [PathIndex] model Object.
  ///
  /// **dataType:** It is the datatype for which the indexing behavior is applied to.
  /// Can be String, Number, Point, Polygon, or LineString. Booleans and nulls are automatically indexed
  ///
  /// [Type:] String *required*
  ///
  /// **kind:** The type of index.
  /// Hash indexes are useful for equality comparisons while Range indexes are useful for equality, range comparisons and sorting.
  /// Spatial indexes are useful for spatial queries.
  ///
  /// [Type:] String *optional* ('Hash' or 'Spatial')
  ///
  /// [Default value:] '' (sets the kind to Hash)
  ///
  /// **precision:** The precision of the index. Can be either set to -1 for maximum precision or between 1-8 for Number, and 1-100 for String.
  /// Not applicable for Point, Polygon, and LineString data types.
  ///
  /// [Type:] int *optional*
  ///
  /// [Default value:] -1
  PathIndex({
    required this.dataType,
    this.kind = 'Range',
    this.precision = -1,
  });

  /// **Description:** Transforms the [PathIndex] model to a Map for the CosmosDB API.
  Map<String, dynamic> toMap() {
    return {
      'kind': kind,
      'dataType': dataType,
      'precision': precision,
    };
  }

  /// **Description:** Transforms a Map from the CosmosDB API to the [PathIndex] model.
  PathIndex.fromMap(Map<String, dynamic> map)
      : kind = map['kind'] ?? '',
        dataType = map['dataType'] ?? '',
        precision = map['precision'] ?? -1;
}
