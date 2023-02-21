import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/collection_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_sub_models/collection_resolution_policy_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_sub_models/geospatial_config_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_sub_models/index_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_sub_models/indexing_policy_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_sub_models/partition_key_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_sub_models/path_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_sub_models/unique_policy_model.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  test('Model is a correct map when created manually', () {
    // arrange
    final collectionListModel = CollectionList(
      count: 1,
      error: {},
      rid: 'KiAXAA==',
      collections: [
        Collection(
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
              IncludedPath(path: '/*', indexes: [
                PathIndex(dataType: 'String', kind: 'Range', precision: -1),
                PathIndex(dataType: 'Number', kind: 'Range', precision: -1),
              ]),
            ],
            excludedPaths: [
              ExcludedPath(
                path: '/"_etag"/?',
              ),
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
        )
      ],
    );
    final collectionListMap =
        json.decode(fixture('collection-list-success.json'));
    // act
    // assert
    expect(collectionListModel.toMap(), collectionListMap);
  });

  test('Model has a correct error when created manually', () {
    // arrange
    final collectionListModel = CollectionList(
      error: {
        "code": "BadRequest",
        "message":
            "Request url is invalid.\r\nActivityId: 9e68f294-7603-4502-a009-6b5dff0a2759, Microsoft.Azure.Documents.Common/2.14.0"
      },
      rid: '',
      count: 0,
    );
    final errorMap = json.decode(fixture('general-error.json'));
    // act
    // assert
    expect(collectionListModel.toMap(), errorMap);
  });

  test('Model is correct for any kind of api endpoint', () {
    // arrange
    final collectionListModel =
        json.decode(fixture('collection-list-success.json'));
    // act
    final baseModel = CollectionList.fromMap(collectionListModel);
    // assert
    expect(baseModel.toMap(), collectionListModel);
  });

  test('Model has an error object', () {
    // arrange
    final errorMap = json.decode(fixture('general-error.json'));
    // act
    final collectionListModel = CollectionList.fromMap(errorMap);
    // assert
    expect(collectionListModel.toMap(), errorMap);
  });
}
