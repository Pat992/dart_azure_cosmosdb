import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/permission_model.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  test('Model is correct for any kind of api endpoint', () {
    // arrange
    final permissionMap = json.decode(fixture('permission-success.json'));
    // act
    final permission = Permission.fromMap(permissionMap);
    // assert
    expect(permission.toMap(), permissionMap);
  });

  test('Model has an error object', () {
    // arrange
    final errorMap = json.decode(fixture('general-error.json'));
    // act
    final permission = Permission.fromMap(errorMap);
    // assert
    expect(permission.toMap(), errorMap);
  });
}
