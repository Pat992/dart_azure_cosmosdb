import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/user_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/user_model.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  test('Model is a correct map when created manually', () {
    // arrange
    final userListModel = UserList(
      count: 1,
      error: {},
      rid: 'Sl8fAA==',
      users: [
        User(
            id: "a_user",
            rid: "Sl8fAFEKCQA=",
            ts: 1449603893,
            self: "dbs\/Sl8fAA==\/users\/Sl8fAFEKCQA=\/",
            etag: "\"00000b00-0000-0000-0000-566733350000\"",
            permissions: "permissions\/"),
      ],
    );
    final userListMap = json.decode(fixture('user-list-success.json'));
    // act
    // assert
    expect(userListModel.toMap(), userListMap);
  });

  test('Model has a correct error when created manually', () {
    // arrange
    final userListModel = UserList(
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
    expect(userListModel.toMap(), errorMap);
  });

  test('Model is correct for any kind of api endpoint', () {
    // arrange
    final userListMap = json.decode(fixture('user-list-success.json'));
    // act
    final userListModel = UserList.fromMap(userListMap);
    // assert
    expect(userListModel.toMap(), userListMap);
  });

  test('Model has an error object', () {
    // arrange
    final errorMap = json.decode(fixture('general-error.json'));
    // act
    final userListModel = UserList.fromMap(errorMap);
    // assert
    expect(userListModel.toMap(), errorMap);
  });
}
