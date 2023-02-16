import 'package:dart_azure_cosmosdb/src/core/enum/base_enum.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/base_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_database_datasource.dart';

class DatabaseDatasource extends BaseDatasource implements IDatabaseDatasource {
  DatabaseDatasource({
    required super.baseUrl,
    required super.primaryKey,
    super.authorizationType = 'master',
    super.authorizationVersion = '1.0',
    super.xmsVersion = '2018-12-31',
    required super.authUtil,
  }) : super(resourceType: ResourceType.dbs);

  @override
  Future<Map<String, dynamic>> list() async {
    final String urlExtension = '/${ResourceType.dbs.value}';

    return await getRequest(urlExtension: urlExtension);
  }

  @override
  Future<Map<String, dynamic>> get({required String dbId}) async {
    final String resourceLink = '${ResourceType.dbs.value}/$dbId';
    final String urlExtension = '/$resourceLink';

    return await getRequest(
      urlExtension: urlExtension,
      resourceLink: resourceLink,
    );
  }

  @override
  Future<Map<String, dynamic>> create({required String dbId}) async {
    final String urlExtension = '/${ResourceType.dbs.value}';
    final Map<String, String> body = {'id': dbId};

    return await postRequest(
      urlExtension: urlExtension,
      body: body,
    );
  }

  @override
  Future<Map<String, dynamic>> delete({required String dbId}) async {
    final String resourceLink = '${ResourceType.dbs.value}/$dbId';
    final String urlExtension = '/$resourceLink';

    return await deleteRequest(
      urlExtension: urlExtension,
      resourceLink: resourceLink,
    );
  }
}
