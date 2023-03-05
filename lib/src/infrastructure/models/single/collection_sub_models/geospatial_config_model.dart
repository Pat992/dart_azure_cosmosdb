// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
class GeospatialConfig {
  String type;

  GeospatialConfig({
    this.type = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
    };
  }

  GeospatialConfig.fromMap(Map<String, dynamic> map) : type = map['type'] ?? [];
}
