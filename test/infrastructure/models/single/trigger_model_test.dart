import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/trigger_model.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  test('Model is correct for any kind of api endpoint', () {
    // arrange
    final triggerMap = json.decode(fixture('trigger-success.json'));
    // act
    final trigger = Trigger.fromMap(triggerMap);
    // assert
    expect(trigger.toMap(), triggerMap);
  });

  test('Model has an error object', () {
    // arrange
    final errorMap = json.decode(fixture('general-error.json'));
    // act
    final trigger = Trigger.fromMap(errorMap);
    // assert
    expect(trigger.toMap(), errorMap);
  });
}
