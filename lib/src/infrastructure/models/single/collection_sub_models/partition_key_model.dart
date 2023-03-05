// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
class PartitionKey {
  List<dynamic> paths = [];
  String kind;
  int version;

  PartitionKey({
    required this.paths,
    this.kind = 'Hash',
    this.version = 1,
  });

  Map<String, dynamic> toMap() {
    return {
      'paths': paths,
      'kind': kind,
      'version': version,
    };
  }

  PartitionKey.fromMap(Map<String, dynamic> map)
      : paths = map['paths'] ?? [],
        kind = map['kind'] ?? '',
        version = map['version'];
}
