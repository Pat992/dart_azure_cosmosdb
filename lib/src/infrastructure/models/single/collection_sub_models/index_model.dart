// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
class PathIndex {
  String kind;
  String dataType;
  int precision;

  PathIndex({
    this.kind = 'Range',
    this.precision = -1,
    required this.dataType,
  });

  Map<String, dynamic> toMap() {
    return {
      'kind': kind,
      'dataType': dataType,
      'precision': precision,
    };
  }

  PathIndex.fromMap(Map<String, dynamic> map)
      : kind = map['kind'] ?? '',
        dataType = map['dataType'] ?? '',
        precision = map['precision'] ?? -1;
}
