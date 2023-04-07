// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/core/enum/base_enum.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/base_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_collection_datasource.dart';

class CollectionDatasource extends BaseDatasource
    implements ICollectionDatasource {
  CollectionDatasource({
    required super.client,
    required super.connectionUri,
    required super.primaryKey,
    required super.authorizationType,
    required super.authorizationVersion,
    required super.xmsVersion,
    required super.authUtil,
    required super.dateUtil,
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

    final Map<String, dynamic> body = {
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
        '${ResourceType.dbs.value}/$dbId/${resourceType.value}/$collectionId';
    final String urlExtension = '/$resourceLink';

    return await deleteRequest(
      urlExtension: urlExtension,
      resourceLink: resourceLink,
    );
  }
}
