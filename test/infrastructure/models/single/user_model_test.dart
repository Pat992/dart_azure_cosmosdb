import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/user_model.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  test('Model is correct for any kind of api endpoint', () {
    // arrange
    final userMap = json.decode(fixture('user-success.json'));
    // act
    final user = User.fromMap(userMap);
    // assert
    expect(user.toMap(), userMap);
  });

  test('Model has an error object', () {
    // arrange
    final errorMap = json.decode(fixture('general-error.json'));
    // act
    final user = User.fromMap(errorMap);
    // assert
    expect(user.toMap(), errorMap);
  });
}
