import 'package:dart_azure_cosmosdb/src/domain/entities/single/trigger_entity.dart';

class Trigger extends TriggerEntity {
  Trigger({
    super.body = '',
    super.triggerOperation = '',
    super.triggerType = '',
    required super.id,
    super.rid = '',
    super.ts = 0,
    super.self = '',
    super.etag = '',
    super.error = const {},
  });

  Map<String, dynamic> toMap() {
    return {
      'body': body,
      'triggerOperation': triggerOperation,
      'triggerType': triggerType,
      'id': id,
      '_rid': rid,
      '_ts': ts,
      '_self': self,
      '_etag': etag,
    };
  }

  factory Trigger.fromMap(Map<String, dynamic> map) {
    return Trigger(
      body: map['body'] as String,
      triggerOperation: map['triggerOperation'] as String,
      triggerType: map['triggerType'] as String,
      id: map['id'] as String,
      rid: map['_rid'] as String,
      ts: map['_ts'] as int,
      self: map['_self'] as String,
      etag: map['_etag'] as String,
      error: map['error'] as Object,
    );
  }
}
