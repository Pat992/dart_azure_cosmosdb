import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/collection_list_model.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
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
