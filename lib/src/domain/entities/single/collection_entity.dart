import 'package:dart_azure_cosmosdb/src/domain/entities/single/base_entity.dart';
import 'package:dart_azure_cosmosdb/src/domain/entities/single/collection_sub_entities/collection_resolution_policy_entity.dart';
import 'package:dart_azure_cosmosdb/src/domain/entities/single/collection_sub_entities/geospatial_config_entity.dart';
import 'package:dart_azure_cosmosdb/src/domain/entities/single/collection_sub_entities/indexing_policy_entity.dart';
import 'package:dart_azure_cosmosdb/src/domain/entities/single/collection_sub_entities/partition_key_entity.dart';
import 'package:dart_azure_cosmosdb/src/domain/entities/single/collection_sub_entities/unique_policy_entity.dart';

abstract class CollectionEntity extends BaseEntity {
  String docs;
  String sprocs;
  String triggers;
  String udfs;
  String conflicts;
  PartitionKeyEntity? partitionKey;
  IndexingPolicyEntity? indexingPolicy;
  UniqueKeyPolicyEntity? uniqueKeyPolicy;
  GeospatialConfigEntity? geospatialConfig;
  ConflictResolutionPolicyEntity? conflictResolutionPolicy;

  CollectionEntity({
    required super.id,
    super.error = const {},
    required this.partitionKey,
    this.docs = '',
    this.sprocs = '',
    this.triggers = '',
    this.udfs = '',
    this.conflicts = '',
    this.indexingPolicy,
    this.uniqueKeyPolicy,
    this.geospatialConfig,
    this.conflictResolutionPolicy,
  });
}
