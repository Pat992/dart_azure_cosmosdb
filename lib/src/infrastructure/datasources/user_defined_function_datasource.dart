// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/core/enum/base_enum.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/base_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_user_defined_function_datasource.dart';

class UserDefinedFunctionDatasource extends BaseDatasource
    implements IUserDefinedFunctionDatasource {
  UserDefinedFunctionDatasource({
    required super.client,
    required super.connectionUri,
    required super.primaryKey,
    required super.authorizationType,
    required super.authorizationVersion,
    required super.xmsVersion,
    required super.authUtil,
    required super.dateUtil,
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

    final Map<String, dynamic> body = {
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

    final Map<String, dynamic> body = {
      'id': userDefinedFunctionId,
      'body': function,
    };
    return await putRequest(
      urlExtension: urlExtension,
      resourceLink: resourceLink,
      body: body,
    );
  }
}
