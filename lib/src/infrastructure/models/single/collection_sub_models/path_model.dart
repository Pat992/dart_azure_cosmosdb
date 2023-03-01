// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_sub_models/index_model.dart';

abstract class Path {
  String path;
  List<PathIndex> indexes = [];

  Path({
    required this.path,
    this.indexes = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'path': path,
      'indexes': indexes.map((index) => index.toMap()).toList(),
    };
  }

  Path.fromMap(Map<String, dynamic> map) : path = map['path'] ?? '' {
    if (map.containsKey('indexes')) {
      for (final index in map['indexes']) {
        indexes.add(PathIndex.fromMap(index));
      }
    }
  }
}

class IncludedPath extends Path {
  IncludedPath({
    required super.path,
    super.indexes = const [],
  });

  IncludedPath.fromMap(Map<String, dynamic> map) : super.fromMap(map);
}

class ExcludedPath extends Path {
  ExcludedPath({
    required super.path,
    super.indexes = const [],
  });

  ExcludedPath.fromMap(Map<String, dynamic> map) : super.fromMap(map);
}
