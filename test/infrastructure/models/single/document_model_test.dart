import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/document_model.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
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
