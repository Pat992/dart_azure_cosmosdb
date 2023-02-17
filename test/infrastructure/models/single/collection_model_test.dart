import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_sub_models/collection_resolution_policy_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_sub_models/geospatial_config_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_sub_models/indexing_policy_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_sub_models/partition_key_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_sub_models/path_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_sub_models/unique_policy_model.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  test('Model is a correct map when created manually', () {
    // arrange
    final collectionMap = json.decode(fixture('collection-success.json'));
    final collection = Collection(
      id: 'myTestContainer',
      rid: 'KiAXAIQ5uQY=',
      ts: 1652612926,
      self: 'dbs/KiAXAA==/colls/KiAXAIQ5uQY=/',
      etag: '"00008905-0000-0700-0000-6280df3e0000"',
      docs: 'docs/',
      sprocs: 'sprocs/',
      triggers: 'triggers/',
      udfs: 'udfs/',
      conflicts: 'conflicts/',
      geospatialConfig: GeospatialConfig(
        type: 'Geography',
      ),
      uniqueKeyPolicy: UniqueKeyPolicy(
        uniqueKeys: ["/fistname/lastname"],
      ),
      indexingPolicy: IndexingPolicy(
        includedPaths: [
          IncludedPath(
            path: '/*',
          )
        ],
        excludedPaths: [
          ExcludedPath(path: '/"_etag"/?'),
        ],
      ),
      partitionKey: PartitionKey(
        version: 1,
        paths: ['/id'],
        kind: 'Hash',
      ),
      conflictResolutionPolicy: ConflictResolutionPolicy(
        conflictResolutionPath: '/_ts',
        mode: 'LastWriterWins',
      ),
    );
    // act
    // assert
    expect(collection.toMap(), collectionMap);
  });

  test('Model has a correct error when created manually', () {
    // arrange
    final baseMap = json.decode(fixture('base-error.json'));
    // act
    // assert
  });

  test('Model is correct for any kind of api endpoint', () {
    // arrange
    final collection = json.decode(fixture('collection-success.json'));
    final baseMap = json.decode(fixture('base-success.json'));
    // act
    // assert
  });

  test('Model has an error object', () {
    // arrange
    final collection = json.decode(fixture('general-error.json'));
    final baseMap = json.decode(fixture('base-error.json'));
    // act
    // assert
  });
}
