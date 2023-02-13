import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_sub_models/index_model.dart';

abstract class Path {
  String path;
  List<PathIndex> indexes;

  Path({
    required this.path,
    this.indexes = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'path': path,
      'indexes': indexes,
    };
  }

  Path.fromMap(Map<String, dynamic> map)
      : path = map['path'] ?? '',
        indexes = map['indexes'] ?? [];
}

class IncludedPath extends Path {
  IncludedPath({
    required super.path,
  });

  IncludedPath.fromMap(Map<String, dynamic> map) : super.fromMap(map);
}

class ExcludedPath extends Path {
  ExcludedPath({
    required super.path,
  });

  ExcludedPath.fromMap(Map<String, dynamic> map) : super.fromMap(map);
}
