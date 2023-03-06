import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/user_defined_function_model.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  test('Model is correct for any kind of api endpoint', () {
    // arrange
    final userDefinedFunctionMap =
        json.decode(fixture('user-defined-function-success.json'));
    // act
    final userDefinedFunction =
        UserDefinedFunction.fromMap(userDefinedFunctionMap);
    // assert
    expect(userDefinedFunction.toMap(), userDefinedFunctionMap);
  });

  test('Model has an error object', () {
    // arrange
    final errorMap = json.decode(fixture('general-error.json'));
    // act
    final userDefinedFunction = UserDefinedFunction.fromMap(errorMap);
    // assert
    expect(userDefinedFunction.toMap(), errorMap);
  });
}
