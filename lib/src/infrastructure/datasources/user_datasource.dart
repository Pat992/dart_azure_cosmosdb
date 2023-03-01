// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/core/enum/base_enum.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/base_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_user_datasource.dart';

class UserDatasource extends BaseDatasource implements IUserDatasource {
  UserDatasource({
    required super.client,
    required super.baseUrl,
    required super.primaryKey,
    required super.authorizationType,
    required super.authorizationVersion,
    required super.xmsVersion,
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

    final Map<String, dynamic> body = {"id": userId};

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

    final Map<String, dynamic> body = {"id": newUserId};

    return await putRequest(
      urlExtension: urlExtension,
      resourceLink: resourceLink,
      body: body,
    );
  }
}
