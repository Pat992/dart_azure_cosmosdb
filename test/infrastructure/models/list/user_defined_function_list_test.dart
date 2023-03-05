import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/user_defined_function_list_model.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  test('Model is correct for any kind of api endpoint', () {
    // arrange
    final userDefinedFunctionListMap =
        json.decode(fixture('user-defined-function-list-success.json'));
    // act
    final userDefinedFunctionListModel =
        UserDefinedFunctionList.fromMap(userDefinedFunctionListMap);
    // assert
    expect(userDefinedFunctionListModel.toMap(), userDefinedFunctionListMap);
  });

  test('Model has an error object', () {
    // arrange
    final errorMap = json.decode(fixture('general-error.json'));
    // act
    final userDefinedFunctionListModel =
        UserDefinedFunctionList.fromMap(errorMap);
    // assert
    expect(userDefinedFunctionListModel.toMap(), errorMap);
  });
}
