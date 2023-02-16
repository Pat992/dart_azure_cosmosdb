import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/base_model.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  test('Model is correct for any kind of api endpoint', () {
    // arrange
    final collection = json.decode(fixture('collection-success.json'));
    final baseMap = json.decode(fixture('base-success.json'));
    // act
    final baseModel = Base.fromMap(collection);
    // assert
    expect(baseModel.toMap(), baseMap);
  });

  test('Model has an error object', () {
    // arrange
    final collection = json.decode(fixture('general-error.json'));
    final baseMap = json.decode(fixture('base-error.json'));
    // act
    final baseModel = Base.fromMap({'error': collection});
    // assert
    expect(baseModel.toMap(), baseMap);
  });
}
