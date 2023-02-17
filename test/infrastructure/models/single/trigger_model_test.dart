import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/core/enum/trigger_enum.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/trigger_model.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  test('Model is a correct map when created manually', () {
    // arrange
    final triggerMap = json.decode(fixture('trigger-success.json'));
    final trigger = Trigger(
      body:
          "function updateMetadata() {\r\n    var context = getContext();\r\n    var collection = context.getCollection();\r\n    var response = context.getResponse();\r\n    var createdDocument = response.getBody();\r\n\r\n    // query for metadata document\r\n    var filterQuery = 'SELECT * FROM root r WHERE r.id = \"_metadata\"';\r\n    var accept = collection.queryDocuments(collection.getSelfLink(), filterQuery,\r\n      updateMetadataCallback);\r\n    if(!accept) throw \"Unable to update metadata, abort\";\r\n\r\n    function updateMetadataCallback(err, documents, responseOptions) {\r\n      if(err) throw new Error(\"Error\" + err.message);\r\n           if(documents.length != 1) throw 'Unable to find metadata document';\r\n           var metadataDocument = documents[0];\r\n\r\n           // update metadata\r\n           metadataDocument.createdDocuments += 1;\r\n           metadataDocument.createdNames += \" \" + createdDocument.id;\r\n           var accept = collection.replaceDocument(metadataDocument._self,\r\n               metadataDocument, function(err, docReplaced) {\r\n                  if(err) throw \"Unable to update metadata, abort\";\r\n               });\r\n           if(!accept) throw \"Unable to update metadata, abort\";\r\n           return;          \r\n    }",
      id: "PostTrigger-UpdateMetaAll",
      triggerOperation: TriggerOperation.all,
      triggerType: TriggerType.post,
      rid: "Sl8fALN4sw4BAAAAAAAAcA==",
      ts: 1449689654,
      self:
          "dbs\/Sl8fAA==\/colls\/Sl8fALN4sw4=\/triggers\/Sl8fALN4sw4BAAAAAAAAcA==\/",
      etag: "\"060022e5-0000-0000-0000-566882360000\"",
    );
    // act
    // assert
    expect(trigger.toMap(), triggerMap);
  });

  test('Model has a correct error when created manually', () {
    // arrange
    final errorMap = json.decode(fixture('general-error.json'));
    final trigger = Trigger(
      id: '1',
      body: '',
      triggerOperation: TriggerOperation.all,
      triggerType: TriggerType.pre,
      error: {
        "code": "BadRequest",
        "message":
            "Request url is invalid.\r\nActivityId: 9e68f294-7603-4502-a009-6b5dff0a2759, Microsoft.Azure.Documents.Common/2.14.0"
      },
    );
    // act
    // assert
    expect(trigger.toMap(), errorMap);
  });

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
