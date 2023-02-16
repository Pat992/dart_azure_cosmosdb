import 'package:dart_azure_cosmosdb/src/core/enum/base_enum.dart';
import 'package:dart_azure_cosmosdb/src/core/enum/trigger_enum.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/base_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_trigger_datasource.dart';

class TriggerDatasource extends BaseDatasource implements ITriggerDatasource {
  TriggerDatasource({
    required super.baseUrl,
    required super.primaryKey,
    super.authorizationType = 'master',
    super.authorizationVersion = '1.0',
    super.xmsVersion = '2018-12-31',
    required super.authUtil,
  }) : super(resourceType: ResourceType.triggers);

  @override
  Future<Map<String, dynamic>> list({
    required String dbId,
    required String collectionId,
  }) async {
    final String resourceLink =
        '${ResourceType.dbs.value}/$dbId/${ResourceType.collections.value}/$collectionId';
    final String urlExtension = '/$resourceLink/${resourceType.value}';

    return await getRequest(
      urlExtension: urlExtension,
      resourceLink: resourceLink,
    );
  }

  @override
  create({
    required String dbId,
    required String collectionId,
    required String triggerId,
    required String function,
    required TriggerOperation triggerOperation,
    required TriggerType triggerType,
  }) async {
    final String resourceLink =
        '${ResourceType.dbs.value}/$dbId/${ResourceType.collections.value}/$collectionId';
    final String urlExtension = '/$resourceLink/${resourceType.value}';

    Map<String, dynamic> body = {
      'id': triggerId,
      'body': function,
      'triggerOperation': triggerOperation.value,
      'triggerType': triggerType.value,
    };

    return await postRequest(
      urlExtension: urlExtension,
      resourceLink: resourceLink,
      body: body,
    );
  }

  @override
  Future<Map<String, dynamic>> delete({
    required String dbId,
    required String collectionId,
    required String triggerId,
  }) async {
    final String resourceLink =
        '${ResourceType.dbs.value}/$dbId/${ResourceType.collections.value}/$collectionId/${resourceType.value}/$triggerId';
    final String urlExtension = '/$resourceLink';

    return await deleteRequest(
      urlExtension: urlExtension,
      resourceLink: resourceLink,
    );
  }

  @override
  Future<Map<String, dynamic>> replace({
    required String dbId,
    required String collectionId,
    required String triggerId,
    required String function,
    required TriggerOperation triggerOperation,
    required TriggerType triggerType,
  }) async {
    final String resourceLink =
        '${ResourceType.dbs.value}/$dbId/${ResourceType.collections.value}/$collectionId/${resourceType.value}/$triggerId';
    final String urlExtension = '/$resourceLink';

    Map<String, dynamic> body = {
      'id': triggerId,
      'body': function,
      'triggerOperation': triggerOperation.value,
      'triggerType': triggerType.value,
    };

    return await putRequest(
      urlExtension: urlExtension,
      resourceLink: resourceLink,
      body: body,
    );
  }
}