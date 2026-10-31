// Copyright 2026 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:dart_azure_cosmosdb/src/core/auth_util.dart';
import 'package:dart_azure_cosmosdb/src/core/date_util.dart';
import 'package:dart_azure_cosmosdb/src/core/enum/base_enum.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_base_datasource.dart';
import 'package:dio/dio.dart';

class BaseDatasource implements IBaseDatasource {
  IAuthUtil authUtil;
  IDateUtil dateUtil;
  final Dio client;
  String connectionUri;
  String authorizationType;
  String authorizationVersion;
  String primaryKey;
  ResourceType resourceType;
  String xmsVersion;

  BaseDatasource({
    required this.client,
    required this.authUtil,
    required this.dateUtil,
    required this.resourceType,
    required this.xmsVersion,
    required this.connectionUri,
    required this.authorizationType,
    required this.authorizationVersion,
    required this.primaryKey,
  });

  @override
  Future<Map<String, dynamic>> getRequest({
    required String urlExtension,
    String resourceLink = '',
    Map<String, String> additionalHeader = const {},
  }) async {
    final headers = generateHeaders(
      resourceLink: resourceLink,
      method: 'get',
      additionalHeader: additionalHeader,
    );

    var response = await client.get(
      '$connectionUri$urlExtension',
      options: Options(headers: headers),
    );

    return response.data;
  }

  @override
  Future<Map<String, dynamic>> postRequest({
    required String urlExtension,
    required Map<String, dynamic> body,
    String resourceLink = '',
    Map<String, String> additionalHeader = const {},
    String? contentType,
  }) async {
    final headers = generateHeaders(
      resourceLink: resourceLink,
      method: 'post',
      additionalHeader: additionalHeader,
      contentType: contentType,
    );

    var response = await client.post(
      '$connectionUri$urlExtension',
      options: Options(headers: headers),
      data: body,
    );

    return response.data;
  }

  @override
  Future<String> executionRequest({
    required String urlExtension,
    required List<dynamic> arrBody,
    String resourceLink = '',
  }) async {
    final headers = generateHeaders(
      resourceLink: resourceLink,
      method: 'post',
      additionalHeader: {},
    );

    var response = await client.post(
      '$connectionUri$urlExtension',
      options: Options(headers: headers),
      data: arrBody,
    );

    return response.data;
  }

  @override
  Future<Map<String, dynamic>> putRequest({
    required String urlExtension,
    required Map<String, dynamic> body,
    String resourceLink = '',
    Map<String, String> additionalHeader = const {},
    String? contentType,
  }) async {
    final headers = generateHeaders(
      resourceLink: resourceLink,
      method: 'put',
      additionalHeader: additionalHeader,
      contentType: contentType,
    );

    var response = await client.put(
      '$connectionUri$urlExtension',
      options: Options(headers: headers),
      data: body,
    );

    return response.data;
  }

  @override
  Future<Map<String, dynamic>> deleteRequest({
    required String urlExtension,
    String resourceLink = '',
    Map<String, String> additionalHeader = const {},
    String? contentType,
  }) async {
    final headers = generateHeaders(
      resourceLink: resourceLink,
      method: 'delete',
      additionalHeader: additionalHeader,
    );

    var response = await client.delete(
      '$connectionUri$urlExtension',
      options: Options(headers: headers),
    );

    final res = response.data;

    if (res == null || res == '') {
      return {};
    }

    return res;
  }

  @override
  Map<String, String> generateHeaders({
    required String resourceLink,
    required String method,
    required Map<String, String> additionalHeader,
    String? contentType,
  }) {
    final utcString = dateUtil.createDate();

    final authHeader = authUtil.getHeaders(
      authorizationType: authorizationType,
      contentType: contentType ?? 'application/json',
      authorizationVersion: authorizationVersion,
      primaryKey: primaryKey,
      resourceType: resourceType.value,
      resourceLink: resourceLink,
      method: method,
      utcNow: utcString,
      xmsVersion: xmsVersion,
    );

    if (additionalHeader.isNotEmpty) {
      authHeader.addAll(additionalHeader);
    }

    return authHeader;
  }
}
