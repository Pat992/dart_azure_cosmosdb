import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/database_model.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  test('Model is correct for any kind of api endpoint', () {
    // arrange
    final dbMap = json.decode(fixture('database-success.json'));
    // act
    final db = CosmosDatabase.fromMap(dbMap);
    // assert
    expect(db.toMap(), dbMap);
  });

  test('Model has an error object', () {
    // arrange
    final errorMap = json.decode(fixture('general-error.json'));
    // act
    final db = CosmosDatabase.fromMap(errorMap);
    // assert
    expect(db.toMap(), errorMap);
  });
}
