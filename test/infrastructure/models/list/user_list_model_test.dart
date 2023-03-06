import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/user_list_model.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
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
