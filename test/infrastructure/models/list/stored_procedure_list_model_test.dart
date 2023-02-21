import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/stored_procedure_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/stored_procedure_model.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  test('Model is a correct map when created manually', () {
    // arrange
    final storedProcedureListModel = StoredProcedureList(
      count: 1,
      error: {},
      rid: 'Sl8fALN4sw4=',
      storedProcedures: [
        StoredProcedure(
          body:
              "function () {\r\n    var context = getContext();\r\n    var response = context.getResponse();\r\n\r\n    response.setBody(\"Hello, World!\");\r\n}",
          id: "sproc_hello_world",
          rid: "Sl8fALN4sw4CAAAAAAAAgA==",
          ts: 1449681197,
          self:
              "dbs\/Sl8fAA==\/colls\/Sl8fALN4sw4=\/sprocs\/Sl8fALN4sw4CAAAAAAAAgA==\/",
          etag: "\"06003ce1-0000-0000-0000-5668612d0000\"",
        ),
      ],
    );
    final storedProcedureListMap =
        json.decode(fixture('stored-procedure-list-success.json'));
    // act
    // assert
    expect(storedProcedureListModel.toMap(), storedProcedureListMap);
  });

  test('Model has a correct error when created manually', () {
    // arrange
    final storedProcedureListModel = StoredProcedureList(
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
    expect(storedProcedureListModel.toMap(), errorMap);
  });

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
