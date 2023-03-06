// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

/// In your container, the Geospatial Configuration specifies how the spatial data will be indexed.
class GeospatialConfig {
  /// **Description:** Specify one Geospatial Configuration per container: geography or geometry.
  ///
  /// **Example:** 'Geography'
  String type;

  /// **Description:** Creates a [GeospatialConfig] model Object.
  ///
  /// **type:** Specify one Geospatial Configuration per container: geography or geometry.
  ///
  /// [Type:] String *optional* (Geography or Geometry)
  ///
  /// [Default value:] '' (sets the type to Geography)
  GeospatialConfig({
    this.type = '',
  });

  /// **Description:** Transforms the [GeospatialConfig] model to a Map for the CosmosDB API.
  Map<String, dynamic> toMap() {
    return {
      'type': type,
    };
  }

  /// **Description:** Transforms a Map from the CosmosDB API to the [GeospatialConfig] model.
  GeospatialConfig.fromMap(Map<String, dynamic> map) : type = map['type'] ?? [];
}
