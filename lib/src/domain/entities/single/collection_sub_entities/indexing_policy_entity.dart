import 'package:dart_azure_cosmosdb/src/domain/entities/single/collection_sub_entities/path_entity.dart';

abstract class IndexingPolicyEntity {
  String indexingMode;
  bool automatic;
  List<IncludedPathEntity> includedPaths;
  List<ExcludedPathEntity> excludedPaths;

  IndexingPolicyEntity({
    this.indexingMode = 'consistent',
    this.automatic = true,
    required this.includedPaths,
    required this.excludedPaths,
  });
}
