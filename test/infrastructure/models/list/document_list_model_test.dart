import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/document_list_model.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
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
