import 'package:dart_azure_cosmosdb/src/domain/entities/lists/base_list_entity.dart';
import 'package:dart_azure_cosmosdb/src/domain/entities/single/trigger_entity.dart';

abstract class TriggerListEntity extends BaseListEntity {
  List<TriggerEntity> triggers;

  TriggerListEntity({
    super.error = const {},
    this.triggers = const [],
  });
}
