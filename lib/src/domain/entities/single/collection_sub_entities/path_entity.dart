import 'package:dart_azure_cosmosdb/src/domain/entities/single/collection_sub_entities/index_entity.dart';

abstract class PathEntity {
  String path;
  List<IndexEntity> indexes;

  PathEntity({
    required this.path,
    this.indexes = const [],
  });
}

abstract class IncludedPathEntity extends PathEntity {
  IncludedPathEntity({
    required super.path,
  });
}

abstract class ExcludedPathEntity extends PathEntity {
  ExcludedPathEntity({
    required super.path,
  });
}
