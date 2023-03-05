import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/database_list_model.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  test('Model is correct for any kind of api endpoint', () {
    // arrange
    final dbListMap = json.decode(fixture('database-list-success.json'));
    // act
    final dbListModel = CosmosDatabaseList.fromMap(dbListMap);
    // assert
    expect(dbListModel.toMap(), dbListMap);
  });

  test('Model has an error object', () {
    // arrange
    final errorMap = json.decode(fixture('general-error.json'));
    // act
    final dbListModel = CosmosDatabaseList.fromMap(errorMap);
    // assert
    expect(dbListModel.toMap(), errorMap);
  });
}
