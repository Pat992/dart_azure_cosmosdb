import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/base_model.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  test('Model is a correct map when created manually', () {
    // arrange
    final baseModel = Base(
      id: 'myTestContainer',
      error: {},
      rid: 'KiAXAIQ5uQY=',
      ts: 1652612926,
      self: 'dbs/KiAXAA==/colls/KiAXAIQ5uQY=/',
      etag: '"00008905-0000-0700-0000-6280df3e0000"',
    );
    final baseMap = json.decode(fixture('base-success.json'));
    // act
    // assert
    expect(baseModel.toMap(), baseMap);
  });

  test('Model has a correct error when created manually', () {
    // arrange
    final baseModel = Base(
      id: '',
      error: {
        "code": "BadRequest",
        "message":
            "Request url is invalid.\r\nActivityId: 9e68f294-7603-4502-a009-6b5dff0a2759, Microsoft.Azure.Documents.Common/2.14.0"
      },
      rid: '',
      ts: 0,
      self: '',
      etag: '',
    );
    final errorMap = json.decode(fixture('general-error.json'));
    // act
    // assert
    expect(baseModel.toMap(), errorMap);
  });

  test('Model is correct for any kind of api endpoint', () {
    // arrange
    final collection = json.decode(fixture('collection-success.json'));
    final baseMap = json.decode(fixture('base-success.json'));
    // act
    final baseModel = Base.fromMap(collection);
    // assert
    expect(baseModel.toMap(), baseMap);
  });

  test('Model has an error object', () {
    // arrange
    final errorMap = json.decode(fixture('general-error.json'));
    // act
    final baseModel = Base.fromMap(errorMap);
    // assert
    expect(baseModel.toMap(), errorMap);
  });
}
