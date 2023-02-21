import 'package:dart_azure_cosmosdb/src/core/enum/base_enum.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/base_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_user_defined_function_datasource.dart';

class UserDefinedFunctionDatasource extends BaseDatasource
    implements IUserDefinedFunctionDatasource {
  UserDefinedFunctionDatasource({
    required super.client,
    required super.baseUrl,
    required super.primaryKey,
    required super.authorizationType,
    required super.authorizationVersion,
    required super.xmsVersion,
    required super.authUtil,
  }) : super(resourceType: ResourceType.userDefinedFunctions);

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
    required String userDefinedFunctionId,
    required String function,
  }) async {
    final String resourceLink =
        '${ResourceType.dbs.value}/$dbId/${ResourceType.collections.value}/$collectionId';
    final String urlExtension = '/$resourceLink/${resourceType.value}';

    Map<String, dynamic> body = {
      'id': userDefinedFunctionId,
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
    required String userDefinedFunctionId,
  }) async {
    final String resourceLink =
        '${ResourceType.dbs.value}/$dbId/${ResourceType.collections.value}/$collectionId/${resourceType.value}/$userDefinedFunctionId';
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
    required String userDefinedFunctionId,
    required String function,
  }) async {
    final String resourceLink =
        '${ResourceType.dbs.value}/$dbId/${ResourceType.collections.value}/$collectionId/${resourceType.value}/$userDefinedFunctionId';
    final String urlExtension = '/$resourceLink';

    Map<String, dynamic> body = {
      'id': userDefinedFunctionId,
      'body': function,
    };
    return await postRequest(
      urlExtension: urlExtension,
      resourceLink: resourceLink,
      body: body,
    );
  }
}
