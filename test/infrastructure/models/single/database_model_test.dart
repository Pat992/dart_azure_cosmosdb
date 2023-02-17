import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/database_model.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  test('Model is a correct map when created manually', () {
    // arrange
    final dbMap = json.decode(fixture('database-success.json'));
    final db = CosmosDatabase(
        id: "Messages",
        rid: "Ve1NAA==",
        self: "dbs/Ve1NAA==/",
        etag: "\"0000ed01-0000-0700-0000-6272729e0000\"",
        colls: "colls/",
        users: "users/",
        ts: 1651667614);
    // act
    // assert
    expect(db.toMap(), dbMap);
  });

  test('Model has a correct error when created manually', () {
    // arrange
    final errorMap = json.decode(fixture('general-error.json'));
    final db = CosmosDatabase(
      id: '1',
      error: {
        "code": "BadRequest",
        "message":
            "Request url is invalid.\r\nActivityId: 9e68f294-7603-4502-a009-6b5dff0a2759, Microsoft.Azure.Documents.Common/2.14.0"
      },
    );
    // act
    // assert
    expect(db.toMap(), errorMap);
  });

  test('Model is correct for any kind of api endpoint', () {
    // arrange
    final dbMap = json.decode(fixture('database-success.json'));
    // act
    final db = CosmosDatabase.fromMap(dbMap);
    // assert
    expect(db.toMap(), dbMap);
  });

  test('Model has an error object', () {
    // arrange
    final errorMap = json.decode(fixture('general-error.json'));
    // act
    final db = CosmosDatabase.fromMap(errorMap);
    // assert
    expect(db.toMap(), errorMap);
  });
}
