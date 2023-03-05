// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/base_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_sub_models/collection_resolution_policy_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_sub_models/geospatial_config_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_sub_models/indexing_policy_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_sub_models/partition_key_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_sub_models/unique_policy_model.dart';

/// A collection is a container of JSON documents and associated JavaScript application logic, i.e. stored procedures, triggers and user-defined functions.
/// This topic outlines the REST operations used to manage document collections.
class Collection extends Base {
  /// **Description:** It is a system generated property that specifies the addressable path of the documents resource.
  ///
  /// **Example:** 'docs/'
  String docs;

  /// **Description:** It is a system generated property that specifies the addressable path of the stored procedures (sprocs) resource.
  ///
  /// **Example:** 'sprocs/'
  String sprocs;

  /// **Description:** It is a system generated property that specifies the addressable path of the triggers resource.
  ///
  /// **Example:** 'triggers/'
  String triggers;

  /// **Description:** It is a system generated property that specifies the addressable path of the user-defined functions (udfs) resource.
  ///
  /// **Example:** 'udfs/'
  String udfs;

  /// **Description:** It is a system generated property that specifies the addressable path of the conflicts resource.
  /// During an operation on a resource within a collection, if a conflict occurs, users can inspect the conflicting resources by performing a GET on the conflicts URI path.
  ///
  /// **Example:** 'conflicts/'
  String conflicts;

  /// **Description:** This value is used to configure the partition key to be used for partitioning data into multiple partitions.
  ///
  /// **Example:** { "paths": [ "/AccountNumber" ], "kind": "Hash", "Version": 2 }
  PartitionKey partitionKey;

  /// **Description:** This value is used to configure indexing policy. By default, the indexing is automatic for all document paths within the collection.
  ///
  /// **Example:** [{ "path": "/*", "indexes": [{ "dataType": "String", "precision": -1, "kind": "Range" }]}]
  IndexingPolicy? indexingPolicy;

  /// **Description:** This value is used to configure unique key policy. By default, the unique key policy is an empty array or null as an object.
  ///
  /// **Example:** []
  UniqueKeyPolicy? uniqueKeyPolicy;

  /// **Description:** In your container, the Geospatial Configuration specifies how the spatial data will be indexed.
  /// Specify one Geospatial Configuration per container: geography or geometry.
  ///
  /// **Example:** { "type": "Geography" }
  GeospatialConfig? geospatialConfig;

  /// **Description:** For Azure Cosmos DB accounts configured with multiple write regions, update conflicts can occur when writers concurrently update the same item in multiple regions.
  /// Update conflicts can be of the following three types:
  ///
  /// **Insert conflicts:** These conflicts can occur when an application simultaneously inserts two or more items with the same unique index in two or more regions. For example, this conflict might occur with an ID property.
  ///
  /// **Replace conflicts:** These conflicts can occur when an application updates the same item simultaneously in two or more regions.
  ///
  /// **Delete conflicts:** These conflicts can occur when an application simultaneously deletes an item in one region and updates it in another region.
  ///
  /// **Example:** { "mode": "LastWriterWins", "conflictResolutionPath": "/_ts", "conflictResolutionProcedure": "" }
  ConflictResolutionPolicy? conflictResolutionPolicy;

  /// **Description:** Creates a [Collection] model Object.
  ///
  /// **id:** The unique user generated name for the resource.
  /// The id field must not exceed 255 characters.
  ///
  /// [Type:] String *required*
  ///
  /// **partitionKey:** This value is used to configure the partition key to be used for partitioning data into multiple partitions.
  ///
  /// [Type:] PartitionKey *required*
  ///
  /// **indexingPolicy:** This value is used to configure indexing policy. By default, the indexing is automatic for all document paths within the collection.
  ///
  /// [Type:] IndexingPolicy *optional*
  ///
  /// [Default value:] null
  ///
  /// **uniqueKeyPolicy:** This value is used to configure unique key policy. By default, the unique key policy is an empty array or null as an object.
  ///
  /// [Type:] UniqueKeyPolicy *optional*
  ///
  /// [Default value:] null
  ///
  /// **geospatialConfig:** In your container, the Geospatial Configuration specifies how the spatial data will be indexed.
  ///
  /// [Type:] GeospatialConfig *optional*
  ///
  /// [Default value:] null
  ///
  /// **conflictResolutionPolicy:** For Azure Cosmos DB accounts configured with multiple write regions, update conflicts can occur when writers concurrently update the same item in multiple regions.
  ///
  /// [Type:] ConflictResolutionPolicy *optional*
  ///
  /// [Default value:] null
  Collection({
    required super.id,
    required this.partitionKey,
    this.indexingPolicy,
    this.uniqueKeyPolicy,
    this.geospatialConfig,
    this.conflictResolutionPolicy,
  })  : docs = '',
        sprocs = '',
        triggers = '',
        udfs = '',
        conflicts = '',
        super(
          rid: '',
          ts: 0,
          self: '',
          etag: '',
          error: const {},
        );

  /// **Description:** Transforms the [Collection] model to a Map for the CosmosDB API.
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

  /// **Description:** Transforms a Map from the CosmosDB API to the [Collection] model.
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
