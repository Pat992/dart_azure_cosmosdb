import 'package:dart_azure_cosmosdb/src/core/enum/base_enum.dart';
import 'package:dart_azure_cosmosdb/src/core/enum/permission_enum.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/base_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_permission_datasource.dart';

class PermissionDatasource extends BaseDatasource
    implements IPermissionDatasource {
  PermissionDatasource({
    required super.baseUrl,
    required super.primaryKey,
    super.authorizationType = 'master',
    super.authorizationVersion = '1.0',
    super.xmsVersion = '2018-12-31',
    required super.authUtil,
  }) : super(resourceType: ResourceType.permissions);

  @override
  Future<Map<String, dynamic>> list({
    required String dbId,
    required String userId,
  }) async {
    final String resourceLink =
        '${ResourceType.dbs.value}/$dbId/${ResourceType.users.value}/$userId';
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
    required String permissionId,
  }) async {
    final String resourceLink =
        '${ResourceType.dbs.value}/$dbId/${ResourceType.users.value}/$userId/${resourceType.value}/$permissionId';
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
    required String permissionId,
    required String collectionId,
    required PermissionMode permissionMode,
  }) async {
    final String resourceLink =
        '${ResourceType.dbs.value}/$dbId/${ResourceType.users.value}/$userId';
    final String urlExtension = '/$resourceLink/${resourceType.value}';

    Map<String, dynamic> body = {
      'id': permissionId,
      'permissionMode': permissionMode.value,
      'resource':
          '${ResourceType.dbs.value}/$dbId/${ResourceType.collections.value}/$collectionId'
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
    required String userId,
    required String permissionId,
  }) async {
    final String resourceLink =
        '${ResourceType.dbs.value}/$dbId/${ResourceType.users.value}/$userId/${resourceType.value}/$permissionId';
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
    required String newPermissionId,
    required String permissionId,
    required String collectionId,
    required PermissionMode permissionMode,
  }) async {
    final String resourceLink =
        '${ResourceType.dbs.value}/$dbId/${ResourceType.users.value}/$userId/${resourceType.value}/$permissionId';
    final String urlExtension = '/$resourceLink';

    Map<String, dynamic> body = {
      'id': permissionId,
      'permissionMode': permissionMode.value,
      'resource':
          '${ResourceType.dbs.value}/$dbId/${ResourceType.collections.value}/$collectionId'
    };

    return await postRequest(
      urlExtension: urlExtension,
      resourceLink: resourceLink,
      body: body,
    );
  }
}
