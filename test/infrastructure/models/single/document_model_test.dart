import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/document_model.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  test('Model is a correct map when created manually', () {
    // arrange
    final docMap = json.decode(fixture('document-success.json'));
    final doc = CosmosDocument(
      id: "my Product1",
      rid: "KiAXAIQ5uQYBAAAAAAAAAA==",
      self: "dbs/KiAXAA==/colls/KiAXAIQ5uQY=/docs/KiAXAIQ5uQYBAAAAAAAAAA==/",
      etag: "\"0000b90a-0000-0700-0000-628135b70000\"",
      attachements: "attachments/",
      values: {
        'amount': 1,
      },
      ts: 1652635063,
    );
    // act
    // assert
    expect(doc.toMap(), docMap);
  });

  test('Model has a correct error when created manually', () {
    // arrange
    final errorMap = json.decode(fixture('general-error.json'));
    final doc = CosmosDocument(
      id: '1',
      error: {
        "code": "BadRequest",
        "message":
            "Request url is invalid.\r\nActivityId: 9e68f294-7603-4502-a009-6b5dff0a2759, Microsoft.Azure.Documents.Common/2.14.0"
      },
    );
    // act
    // assert
    expect(doc.toMap(), errorMap);
  });

  test('Model is correct for any kind of api endpoint', () {
    // arrange
    final docMap = json.decode(fixture('document-success.json'));
    // act
    final doc = CosmosDocument.fromMap(docMap);
    // assert
    expect(doc.toMap(), docMap);
  });

  test('Model has an error object', () {
    // arrange
    final errorMap = json.decode(fixture('general-error.json'));
    // act
    final doc = CosmosDocument.fromMap(errorMap);
    // assert
    expect(doc.toMap(), errorMap);
  });
}
