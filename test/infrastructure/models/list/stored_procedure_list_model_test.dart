import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/stored_procedure_list_model.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  test('Model is correct for any kind of api endpoint', () {
    // arrange
    final storedProcedureListMap =
        json.decode(fixture('stored-procedure-list-success.json'));
    // act
    final storedProcedureListModel =
        StoredProcedureList.fromMap(storedProcedureListMap);
    // assert
    expect(storedProcedureListModel.toMap(), storedProcedureListMap);
  });

  test('Model has an error object', () {
    // arrange
    final errorMap = json.decode(fixture('general-error.json'));
    // act
    final storedProcedureListModel = StoredProcedureList.fromMap(errorMap);
    // assert
    expect(storedProcedureListModel.toMap(), errorMap);
  });
}
