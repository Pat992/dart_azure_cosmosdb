import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/document_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/document_model.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  test('Model is a correct map when created manually', () {
    // arrange
    final documentListModel = CosmosDocumentList(
      count: 3,
      error: {},
      rid: 'KiAXAIQ5uQY=',
      documents: [
        CosmosDocument(
          id: "my Product1",
          rid: "KiAXAIQ5uQYBAAAAAAAAAA==",
          self:
              "dbs/KiAXAA==/colls/KiAXAIQ5uQY=/docs/KiAXAIQ5uQYBAAAAAAAAAA==/",
          etag: "\"0000b90a-0000-0700-0000-628135b70000\"",
          attachments: "attachments/",
          ts: 1652635063,
          values: {'amount': 1},
        ),
        CosmosDocument(
          id: "my Product2",
          rid: "KiAXAIQ5uQYCAAAAAAAAAA==",
          self:
              "dbs/KiAXAA==/colls/KiAXAIQ5uQY=/docs/KiAXAIQ5uQYCAAAAAAAAAA==/",
          etag: "\"0000ba0a-0000-0700-0000-628135c20000\"",
          attachments: "attachments/",
          ts: 1652635074,
          values: {'amount': 2},
        ),
        CosmosDocument(
          id: "my Product3",
          rid: "KiAXAIQ5uQbiAAAAAAAAAA==",
          self:
              "dbs/KiAXAA==/colls/KiAXAIQ5uQY=/docs/KiAXAIQ5uQbiAAAAAAAAAA==/",
          etag: "\"810561c4-0000-0700-0000-63ea5d5d0000\"",
          attachments: "attachments/",
          ts: 1676303709,
          values: {'amount': 3},
        ),
      ],
    );
    final documentListMap = json.decode(fixture('document-list-success.json'));
    // act
    // assert
    expect(documentListModel.toMap(), documentListMap);
  });

  test('Model has a correct error when created manually', () {
    // arrange
    final documentListModel = CosmosDocumentList(
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
    expect(documentListModel.toMap(), errorMap);
  });

  test('Model is correct for any kind of api endpoint', () {
    // arrange
    final documentListMap = json.decode(fixture('document-list-success.json'));
    // act
    final documentListModel = CosmosDocumentList.fromMap(documentListMap);
    // assert
    expect(documentListModel.toMap(), documentListMap);
  });

  test('Model has an error object', () {
    // arrange
    final errorMap = json.decode(fixture('general-error.json'));
    // act
    final documentListModel = CosmosDocumentList.fromMap(errorMap);
    // assert
    expect(documentListModel.toMap(), errorMap);
  });
}
