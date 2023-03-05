import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/permission_list_model.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  test('Model is correct for any kind of api endpoint', () {
    // arrange
    final permissionListMap =
        json.decode(fixture('permission-list-success.json'));
    // act
    final permissionListModel = PermissionList.fromMap(permissionListMap);
    // assert
    expect(permissionListModel.toMap(), permissionListMap);
  });

  test('Model has an error object', () {
    // arrange
    final errorMap = json.decode(fixture('general-error.json'));
    // act
    final permissionListModel = PermissionList.fromMap(errorMap);
    // assert
    expect(permissionListModel.toMap(), errorMap);
  });
}
