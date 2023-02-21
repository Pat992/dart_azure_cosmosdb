import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/user_defined_function_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/user_defined_function_model.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  test('Model is a correct map when created manually', () {
    // arrange
    final userDefinedFunctionListModel = UserDefinedFunctionList(
        count: 1,
        error: {},
        rid: 'Sl8fALN4sw4=',
        userDefinedFunctions: [
          UserDefinedFunction(
              body:
                  "function tax(income) {\r\n    if(income == undefined) \r\n        throw 'no input';\r\n    if (income < 1000) \r\n        return income * 0.1;\r\n    else if (income < 10000) \r\n        return income * 0.2;\r\n    else\r\n        return income * 0.4;\r\n}",
              id: "simpleTaxUDF",
              rid: "Sl8fALN4sw4BAAAAAAAAYA==",
              ts: 1449688293,
              self:
                  "dbs/Sl8fAA==/colls/Sl8fALN4sw4=/udfs/Sl8fALN4sw4BAAAAAAAAYA==/",
              etag: "\"060072e4-0000-0000-0000-56687ce50000\""),
        ]);
    final userDefinedFunctionListMap =
        json.decode(fixture('user-defined-function-list-success.json'));
    // act
    // assert
    expect(userDefinedFunctionListModel.toMap(), userDefinedFunctionListMap);
  });

  test('Model has a correct error when created manually', () {
    // arrange
    final userDefinedFunctionListModel = UserDefinedFunctionList(
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
    expect(userDefinedFunctionListModel.toMap(), errorMap);
  });

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