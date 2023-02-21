import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/core/auth_util.dart';
import 'package:test/test.dart';

import '../fixtures/fixture_reader.dart';

void main() {
  final authUtil = AuthUtil();

  test('Test Headers', () {
    // arrange
    final authMap = json.decode(fixture('auth-header-success.json'));
    final utcString = 'Sun, 15 May 2022 10:06:39 GMT';
    String pk =
        'BHipJo/AFw5lUZ6v/dOzQF2RPAbS9WQ9QbiFkjhOWNLOTk9LWL/Sm16/ZySbCmBH9bFl4pvLS+egQC0S6cIioA==';
    // act
    final authHeader = authUtil.getHeaders(
      contentType: 'application/json',
      authorizationType: 'master',
      authorizationVersion: '1.0',
      primaryKey: pk,
      resourceType: 'dbs',
      resourceLink: '',
      method: 'get',
      utcNow: utcString,
    );
    // assert
    expect(authHeader, authMap);
  });
}
