import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_model.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  test('Model is correct for any kind of api endpoint', () {
    // arrange
    final collectionMap = json.decode(fixture('collection-success.json'));
    // act
    final collection = Collection.fromMap(collectionMap);
    // assert
    expect(collection.toMap(), collectionMap);
  });

  test('Model has an error object', () {
    // arrange
    final errorMap = json.decode(fixture('general-error.json'));
    // act
    final collection = Collection.fromMap(errorMap);
    // assert
    expect(collection.toMap(), errorMap);
  });
}
