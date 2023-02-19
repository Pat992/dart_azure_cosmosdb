import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/base_list_model.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  test('Model is a correct map when created manually', () {
    // arrange
    final baseListModel = BaseList(
      count: 1,
      error: {},
      rid: 'KiAXAA==',
    );
    final baseListMap = json.decode(fixture('base-list-success.json'));
    // act
    // assert
    expect(baseListModel.toMap(), baseListMap);
  });

  test('Model has a correct error when created manually', () {
    // arrange
    final baseListModel = BaseList(
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
    expect(baseListModel.toMap(), errorMap);
  });

  test('Model is correct for any kind of api endpoint', () {
    // arrange
    final collectionList = json.decode(fixture('collection-list-success.json'));
    final baseMap = json.decode(fixture('base-list-success.json'));
    // act
    final baseModel = BaseList.fromMap(collectionList);
    // assert
    expect(baseModel.toMap(), baseMap);
  });

  test('Model has an error object', () {
    // arrange
    final errorMap = json.decode(fixture('general-error.json'));
    // act
    final baseListModel = BaseList.fromMap(errorMap);
    // assert
    expect(baseListModel.toMap(), errorMap);
  });
}
