import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/stored_procedure_model.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  test('Model is correct for any kind of api endpoint', () {
    // arrange
    final storedProcedureMap =
        json.decode(fixture('stored-procedure-success.json'));
    // act
    final storedProcedure = StoredProcedure.fromMap(storedProcedureMap);
    // assert
    expect(storedProcedure.toMap(), storedProcedureMap);
  });

  test('Model has an error object', () {
    // arrange
    final errorMap = json.decode(fixture('general-error.json'));
    // act
    final storedProcedure = StoredProcedure.fromMap(errorMap);
    // assert
    expect(storedProcedure.toMap(), errorMap);
  });
}
