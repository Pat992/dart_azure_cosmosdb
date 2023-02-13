import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/base_model.dart';

class Trigger extends Base {
  String body;
  String triggerOperation;
  String triggerType;

  Trigger({
    this.body = '',
    this.triggerOperation = '',
    this.triggerType = '',
    required super.id,
    super.rid = '',
    super.ts = 0,
    super.self = '',
    super.etag = '',
    super.error = const {},
  });

  @override
  Map<String, dynamic> toMap() {
    var body = super.toMap();

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
        triggerOperation = map['triggerOperation'] ?? '',
        triggerType = map['triggerType'] ?? '',
        super.fromMap(map);
}
