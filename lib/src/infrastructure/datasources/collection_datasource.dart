import 'package:dart_azure_cosmosdb/src/core/enum/base_enum.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/base_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_collection_datasource.dart';

class CollectionDatasource extends BaseDatasource
    implements ICollectionDatasource {
  CollectionDatasource({
    required super.baseUrl,
    required super.primaryKey,
    super.authorizationType = 'master',
    super.authorizationVersion = '1.0',
    super.xmsVersion = '2018-12-31',
    required super.authUtil,
  }) : super(resourceType: ResourceType.collections);

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
    required String collectionId,
  }) async {
    final String resourceLink =
        '${ResourceType.dbs.value}/$dbId/${resourceType.value}/$collectionId';
    final String urlExtension = '/$resourceLink';

    return await getRequest(
      urlExtension: urlExtension,
      resourceLink: resourceLink,
    );
  }

  @override
  Future<Map<String, dynamic>> create({
    required String dbId,
    required String collectionId,
    required String partitionKey,
    required int version,
  }) async {
    final String resourceLink = '${ResourceType.dbs.value}/$dbId';
    final String urlExtension = '/$resourceLink/${resourceType.value}';

    Map<String, dynamic> body = {
      "id": collectionId,
      "partitionKey": {
        "paths": [partitionKey],
        "kind": "Hash",
        "Version": version,
      }
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
  }) async {
    final String resourceLink =
        '${ResourceType.dbs}/$dbId/${resourceType.value}/$collectionId';
    final String urlExtension = '/$resourceLink';

    return await deleteRequest(
      urlExtension: urlExtension,
      resourceLink: resourceLink,
    );
  }
}
