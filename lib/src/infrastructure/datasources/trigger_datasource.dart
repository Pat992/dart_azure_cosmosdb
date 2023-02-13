import 'package:dart_azure_cosmosdb/src/core/enum/trigger_enum.dart';

abstract class ITriggerDatasource {
  Future<Map<String, dynamic>> list({
    required String dbId,
    required String collectionId,
  });

  create({
    required String dbId,
    required String collectionId,
    required String triggerId,
    required String function,
    required TriggerOperation triggerOperation,
    required TriggerType triggerType,
  });

  Future<Map<String, dynamic>> replace({
    required String dbId,
    required String collectionId,
    required String triggerId,
    required String function,
    required TriggerOperation triggerOperation,
    required TriggerType triggerType,
  });

  Future<Map<String, dynamic>> delete({
    required String dbId,
    required String collectionId,
    required String triggerId,
  });
}
