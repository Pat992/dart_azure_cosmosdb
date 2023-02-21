import 'package:dart_azure_cosmosdb/src/core/enum/trigger_enum.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/models_barrel.dart';

abstract class ITriggerRepository {
  Future<TriggerList> list({
    required String dbId,
    required String collectionId,
  });

  Future<Trigger> create({
    required String dbId,
    required String collectionId,
    required String triggerId,
    required String function,
    required TriggerOperation triggerOperation,
    required TriggerType triggerType,
  });

  Future<Trigger> replace({
    required String dbId,
    required String collectionId,
    required String triggerId,
    required String function,
    required TriggerOperation triggerOperation,
    required TriggerType triggerType,
  });

  Future<Trigger> delete({
    required String dbId,
    required String collectionId,
    required String triggerId,
  });
}
