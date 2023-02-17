import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/base_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_sub_models/collection_resolution_policy_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_sub_models/geospatial_config_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_sub_models/indexing_policy_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_sub_models/partition_key_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_sub_models/unique_policy_model.dart';

class Collection extends Base {
  String docs;
  String sprocs;
  String triggers;
  String udfs;
  String conflicts;
  PartitionKey partitionKey;
  IndexingPolicy? indexingPolicy;
  UniqueKeyPolicy? uniqueKeyPolicy;
  GeospatialConfig? geospatialConfig;
  ConflictResolutionPolicy? conflictResolutionPolicy;

  Collection({
    required this.partitionKey,
    required super.id,
    this.docs = '',
    this.sprocs = '',
    this.triggers = '',
    this.udfs = '',
    this.conflicts = '',
    this.indexingPolicy,
    this.uniqueKeyPolicy,
    this.geospatialConfig,
    this.conflictResolutionPolicy,
    super.rid = '',
    super.ts = 0,
    super.self = '',
    super.etag = '',
    super.error = const {},
  });

  @override
  Map<String, dynamic> toMap() {
    final body = super.toMap();

    if (super.error.isEmpty) {
      body.addAll({
        '_docs': docs,
        '_sprocs': sprocs,
        '_triggers': triggers,
        '_udfs': udfs,
        '_conflicts': conflicts,
        'partitionKey': partitionKey.toMap(),
        'indexingPolicy': indexingPolicy?.toMap() ?? {},
        'uniqueKeyPolicy': uniqueKeyPolicy?.toMap() ?? {},
        'geospatialConfig': geospatialConfig?.toMap() ?? {},
        'conflictResolutionPolicy': conflictResolutionPolicy?.toMap() ?? {},
      });
    }

    return body;
  }

  @override
  Collection.fromMap(Map<String, dynamic> map)
      : docs = map['_docs'] ?? '',
        sprocs = map['_sprocs'] ?? '',
        triggers = map['_triggers'] ?? '',
        udfs = map['_udfs'] ?? '',
        conflicts = map['_conflicts'] ?? '',
        partitionKey = map['partitionKey'] != null
            ? PartitionKey.fromMap(map['partitionKey'])
            : PartitionKey(paths: []),
        indexingPolicy = map['indexingPolicy'] != null
            ? IndexingPolicy.fromMap(map['indexingPolicy'])
            : null,
        uniqueKeyPolicy = map['uniqueKeyPolicy'] != null
            ? UniqueKeyPolicy.fromMap(map['uniqueKeyPolicy'])
            : null,
        geospatialConfig = map['geospatialConfig'] != null
            ? GeospatialConfig.fromMap(map['geospatialConfig'])
            : null,
        conflictResolutionPolicy = map['conflictResolutionPolicy'] != null
            ? ConflictResolutionPolicy.fromMap(map['conflictResolutionPolicy'])
            : null,
        super.fromMap(map);
}
