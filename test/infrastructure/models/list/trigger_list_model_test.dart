import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/trigger_list_model.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  test('Model is correct for any kind of api endpoint', () {
    // arrange
    final triggerListMap = json.decode(fixture('trigger-list-success.json'));
    // act
    final triggerListModel = TriggerList.fromMap(triggerListMap);
    // assert
    expect(triggerListModel.toMap(), triggerListMap);
  });

  test('Model has an error object', () {
    // arrange
    final errorMap = json.decode(fixture('general-error.json'));
    // act
    final triggerListModel = TriggerList.fromMap(errorMap);
    // assert
    expect(triggerListModel.toMap(), errorMap);
  });
}
