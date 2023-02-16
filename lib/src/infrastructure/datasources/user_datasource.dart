import 'package:dart_azure_cosmosdb/src/core/enum/base_enum.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/base_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_user_datasource.dart';

class UserDatasource extends BaseDatasource implements IUserDatasource {
  UserDatasource({
    required super.baseUrl,
    required super.primaryKey,
    super.authorizationType = 'master',
    super.authorizationVersion = '1.0',
    super.xmsVersion = '2018-12-31',
    required super.authUtil,
  }) : super(resourceType: ResourceType.users);

  @override
  Future<Map<String, dynamic>> list({
    required String dbId,
  }) async {
    final String resourceLink = '${ResourceType.dbs.value}/$dbId';
    final String urlExtension = '/$resourceLink/${resourceType.value}';

    return await getRequest(
      urlExtension: urlExtension,
      resourceLink: resourceLink,
    );
  }

  @override
  Future<Map<String, dynamic>> get({
    required String dbId,
    required String userId,
  }) async {
    final String resourceLink =
        '${ResourceType.dbs.value}/$dbId/${resourceType.value}/$userId';
    final String urlExtension = '/$resourceLink';

    return await getRequest(
      urlExtension: urlExtension,
      resourceLink: resourceLink,
    );
  }

  @override
  Future<Map<String, dynamic>> create({
    required String dbId,
    required String userId,
  }) async {
    final String resourceLink = '${ResourceType.dbs.value}/$dbId';
    final String urlExtension = '/$resourceLink/${resourceType.value}';

    Map<String, dynamic> body = {"id": userId};

    return await postRequest(
      urlExtension: urlExtension,
      resourceLink: resourceLink,
      body: body,
    );
  }

  @override
  Future<Map<String, dynamic>> delete({
    required String dbId,
    required String userId,
  }) async {
    final String resourceLink =
        '${ResourceType.dbs.value}/$dbId/${resourceType.value}/$userId';
    final String urlExtension = '/$resourceLink';

    return await deleteRequest(
      urlExtension: urlExtension,
      resourceLink: resourceLink,
    );
  }

  @override
  Future<Map<String, dynamic>> replace({
    required String dbId,
    required String userId,
    required String newUserId,
  }) async {
    final String resourceLink =
        '${ResourceType.dbs.value}/$dbId/${resourceType.value}/$userId';
    final String urlExtension = '/$resourceLink';

    Map<String, dynamic> body = {"id": newUserId};

    return await putRequest(
      urlExtension: urlExtension,
      resourceLink: resourceLink,
      body: body,
    );
  }
}
