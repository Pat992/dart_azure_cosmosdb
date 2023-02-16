import 'package:dart_azure_cosmosdb/src/core/enum/base_enum.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/base_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_stored_procedures_datasource.dart';

class StoredProcedureDatasource extends BaseDatasource
    implements IStoredProcedureDatasource {
  StoredProcedureDatasource({
    required super.baseUrl,
    required super.primaryKey,
    super.authorizationType = 'master',
    super.authorizationVersion = '1.0',
    super.xmsVersion = '2018-12-31',
    required super.authUtil,
  }) : super(resourceType: ResourceType.storedProcedures);

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
  Future<Map<String, dynamic>> create({
    required String dbId,
    required String collectionId,
    required String storedProcedureId,
    required String function,
  }) async {
    final String resourceLink =
        '${ResourceType.dbs.value}/$dbId/${ResourceType.collections.value}/$collectionId';
    final String urlExtension = '/$resourceLink/${resourceType.value}';

    Map<String, dynamic> body = {
      'id': storedProcedureId,
      'body': function,
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
    required String storedProcedureId,
  }) async {
    final String resourceLink =
        '${ResourceType.dbs.value}/$dbId/${ResourceType.collections.value}/$collectionId/${resourceType.value}/$storedProcedureId';
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
    required String storedProcedureId,
    required String function,
  }) async {
    final String resourceLink =
        '${ResourceType.dbs.value}/$dbId/${ResourceType.collections.value}/$collectionId/${resourceType.value}/$storedProcedureId';
    final String urlExtension = '/$resourceLink';

    Map<String, dynamic> body = {
      'id': storedProcedureId,
      'body': function,
    };

    return await putRequest(
      urlExtension: urlExtension,
      resourceLink: resourceLink,
      body: body,
    );
  }

  @override
  Future<Map<String, dynamic>> execute({
    required String dbId,
    required String collectionId,
    required String storedProcedureId,
    required List parameters,
  }) async {
    final String resourceLink =
        '${ResourceType.dbs.value}/$dbId/${ResourceType.collections.value}/$collectionId/${resourceType.value}/$storedProcedureId';
    final String urlExtension = '/$resourceLink';

    return await postRequest(
      urlExtension: urlExtension,
      resourceLink: resourceLink,
      arrBody: parameters,
      body: {},
    );
  }
}
