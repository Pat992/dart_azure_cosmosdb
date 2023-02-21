import 'package:dart_azure_cosmosdb/src/core/enum/trigger_enum.dart';
import 'package:dart_azure_cosmosdb/src/domain/repositories/i_trigger_repository.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_trigger_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/trigger_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/trigger_model.dart';

class TriggerRepository implements ITriggerRepository {
  final ITriggerDatasource triggerDatasource;

  TriggerRepository({required this.triggerDatasource});

  @override
  Future<Trigger> create({
    required String dbId,
    required String collectionId,
    required String triggerId,
    required String function,
    required TriggerOperation triggerOperation,
    required TriggerType triggerType,
  }) async {
    try {
      final res = await triggerDatasource.create(
        dbId: dbId,
        collectionId: collectionId,
        triggerId: triggerId,
        function: function,
        triggerOperation: triggerOperation,
        triggerType: triggerType,
      );

      return Trigger.fromMap(res);
    } catch (e) {
      return Trigger.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }

  @override
  Future<Trigger> delete({
    required String dbId,
    required String collectionId,
    required String triggerId,
  }) async {
    try {
      final res = await triggerDatasource.delete(
        dbId: dbId,
        collectionId: collectionId,
        triggerId: triggerId,
      );

      if (res.isEmpty) {
        return Trigger(
          id: triggerId,
          body: '',
          triggerOperation: TriggerOperation.all,
          triggerType: TriggerType.post,
        );
      }

      return Trigger.fromMap(res);
    } catch (e) {
      return Trigger.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }

  @override
  Future<TriggerList> list({
    required String dbId,
    required String collectionId,
  }) async {
    try {
      final res = await triggerDatasource.list(
        dbId: dbId,
        collectionId: collectionId,
      );

      return TriggerList.fromMap(res);
    } catch (e) {
      return TriggerList.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }

  @override
  Future<Trigger> replace({
    required String dbId,
    required String collectionId,
    required String triggerId,
    required String function,
    required TriggerOperation triggerOperation,
    required TriggerType triggerType,
  }) async {
    try {
      final res = await triggerDatasource.replace(
        dbId: dbId,
        collectionId: collectionId,
        triggerId: triggerId,
        function: function,
        triggerOperation: triggerOperation,
        triggerType: triggerType,
      );

      return Trigger.fromMap(res);
    } catch (e) {
      return Trigger.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }
}
