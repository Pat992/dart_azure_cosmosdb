// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/core/enum/base_enum.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/base_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_document_datasource.dart';

class DocumentDatasource extends BaseDatasource implements IDocumentDatasource {
  DocumentDatasource({
    required super.client,
    required super.baseUrl,
    required super.primaryKey,
    required super.authorizationType,
    required super.authorizationVersion,
    required super.xmsVersion,
    required super.authUtil,
  }) : super(resourceType: ResourceType.docs);

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
  Future<Map<String, dynamic>> get({
    required String dbId,
    required String collectionId,
    required String documentId,
    required String partitionKey,
  }) async {
    final String resourceLink =
        '${ResourceType.dbs.value}/$dbId/${ResourceType.collections.value}/$collectionId/${resourceType.value}/$documentId';
    final String urlExtension = '/$resourceLink';

    final Map<String, String> additionalHeader = {
      'x-ms-documentdb-partitionkey': '["$partitionKey"]'
    };

    return await getRequest(
      urlExtension: urlExtension,
      resourceLink: resourceLink,
      additionalHeader: additionalHeader,
    );
  }

  @override
  Future<Map<String, dynamic>> create({
    required String dbId,
    required String collectionId,
    required String partitionKey,
    required Map<String, dynamic> body,
  }) async {
    final String resourceLink =
        '${ResourceType.dbs.value}/$dbId/${ResourceType.collections.value}/$collectionId';
    final String urlExtension = '/$resourceLink/${resourceType.value}';

    final Map<String, String> additionalHeader = {
      'x-ms-documentdb-partitionkey': '["$partitionKey"]'
    };

    return await postRequest(
      urlExtension: urlExtension,
      resourceLink: resourceLink,
      additionalHeader: additionalHeader,
      body: body,
    );
  }

  @override
  Future<Map<String, dynamic>> delete({
    required String dbId,
    required String collectionId,
    required String documentId,
    required String partitionKey,
  }) async {
    final String resourceLink =
        '${ResourceType.dbs.value}/$dbId/${ResourceType.collections.value}/$collectionId/${resourceType.value}/$documentId';
    final String urlExtension = '/$resourceLink';

    final Map<String, String> additionalHeader = {
      'x-ms-documentdb-partitionkey': '["$partitionKey"]'
    };

    return await deleteRequest(
      urlExtension: urlExtension,
      resourceLink: resourceLink,
      additionalHeader: additionalHeader,
    );
  }

  @override
  Future<Map<String, dynamic>> replace({
    required String dbId,
    required String collectionId,
    required String documentId,
    required String partitionKey,
    required Map<String, dynamic> body,
  }) async {
    final String resourceLink =
        '${ResourceType.dbs.value}/$dbId/${ResourceType.collections.value}/$collectionId/${resourceType.value}/$documentId';
    final String urlExtension = '/$resourceLink';

    final Map<String, String> additionalHeader = {
      'x-ms-documentdb-partitionkey': '["$partitionKey"]'
    };

    return await putRequest(
      urlExtension: urlExtension,
      resourceLink: resourceLink,
      additionalHeader: additionalHeader,
      body: body,
    );
  }

  @override
  Future<Map<String, dynamic>> query({
    required String dbId,
    required String collectionId,
    required String query,
    List parameters = const [],
  }) async {
    final String resourceLink =
        '${ResourceType.dbs.value}/$dbId/${ResourceType.collections.value}/$collectionId';
    final String urlExtension = '/$resourceLink/${resourceType.value}';

    final Map<String, String> additionalHeader = {
      'x-ms-documentdb-isquery': 'True',
      'x-ms-documentdb-query-enablecrosspartition': 'True'
    };

    return await postRequest(
      urlExtension: urlExtension,
      resourceLink: resourceLink,
      body: {'query': query, 'parameters': parameters},
      additionalHeader: additionalHeader,
      contentType: 'application/query+json',
    );
  }
}
