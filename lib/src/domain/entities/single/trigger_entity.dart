import 'package:dart_azure_cosmosdb/src/domain/entities/single/base_entity.dart';

abstract class TriggerEntity extends BaseEntity {
  String body;
  String triggerOperation;
  String triggerType;

  TriggerEntity({
    required super.id,
    super.error = const {},
    required this.body,
    required this.triggerOperation,
    required this.triggerType,
  });
}
