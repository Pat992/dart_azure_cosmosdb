import 'package:dart_azure_cosmosdb/src/core/enum/trigger_enum.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/base_model.dart';

class Trigger extends Base {
  String body;
  TriggerOperation triggerOperation;
  TriggerType triggerType;

  Trigger({
    required super.id,
    required this.body,
    required this.triggerOperation,
    required this.triggerType,
    super.rid = '',
    super.ts = 0,
    super.self = '',
    super.etag = '',
    super.error = const {},
  });

  @override
  Map<String, dynamic> toMap() {
    final body = super.toMap();

    body.addAll({
      'body': body,
      'triggerOperation': triggerOperation,
      'triggerType': triggerType,
    });

    return body;
  }

  @override
  Trigger.fromMap(Map<String, dynamic> map)
      : body = map['body'] ?? '',
        triggerOperation = map['triggerOperation'] == 'All'
            ? TriggerOperation.all
            : map['triggerOperation'] == 'Create'
                ? TriggerOperation.create
                : map['triggerOperation'] == 'Replace'
                    ? TriggerOperation.replace
                    : TriggerOperation.delete,
        triggerType =
            map['triggerType'] == 'Pre' ? TriggerType.pre : TriggerType.post,
        super.fromMap(map);
}
