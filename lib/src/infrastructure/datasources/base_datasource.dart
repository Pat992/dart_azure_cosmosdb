// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/core/auth_util.dart';
import 'package:dart_azure_cosmosdb/src/core/date_util.dart';
import 'package:dart_azure_cosmosdb/src/core/enum/base_enum.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_base_datasource.dart';
import 'package:http/http.dart' as http;

class BaseDatasource implements IBaseDatasource {
  IAuthUtil authUtil;
  IDateUtil dateUtil;
  final http.Client client;
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
    final uri = Uri.parse('$connectionUri$urlExtension');

    final headers = generateHeaders(
      resourceLink: resourceLink,
      method: 'get',
      additionalHeader: additionalHeader,
    );

    var response = await client.get(uri, headers: headers);

    final stringRes = response.body;
    final responseMap = json.decode(stringRes);

    return responseMap;
  }

  @override
  Future<Map<String, dynamic>> postRequest({
    required String urlExtension,
    required Map<String, dynamic> body,
    String resourceLink = '',
    Map<String, String> additionalHeader = const {},
    String? contentType,
  }) async {
    final uri = Uri.parse('$connectionUri$urlExtension');

    final headers = generateHeaders(
      resourceLink: resourceLink,
      method: 'post',
      additionalHeader: additionalHeader,
      contentType: contentType,
    );

    var response = await client.post(
      uri,
      headers: headers,
      body: utf8.encode(json.encode(body)),
    );

    final stringRes = response.body;
    final responseMap = json.decode(stringRes);

    return responseMap;
  }

  @override
  Future<String> executionRequest({
    required String urlExtension,
    required List<dynamic> arrBody,
    String resourceLink = '',
  }) async {
    final uri = Uri.parse('$connectionUri$urlExtension');

    final headers = generateHeaders(
      resourceLink: resourceLink,
      method: 'post',
      additionalHeader: {},
    );

    var response = await client.post(
      uri,
      headers: headers,
      body: json.encode(arrBody),
    );

    return response.body;
  }

  @override
  Future<Map<String, dynamic>> putRequest({
    required String urlExtension,
    required Map<String, dynamic> body,
    String resourceLink = '',
    Map<String, String> additionalHeader = const {},
    String? contentType,
  }) async {
    final uri = Uri.parse('$connectionUri$urlExtension');

    final headers = generateHeaders(
      resourceLink: resourceLink,
      method: 'put',
      additionalHeader: additionalHeader,
      contentType: contentType,
    );

    var response = await client.put(
      uri,
      headers: headers,
      body: json.encode(body),
    );

    final stringRes = response.body;
    final responseMap = json.decode(stringRes);

    return responseMap;
  }

  @override
  Future<Map<String, dynamic>> deleteRequest({
    required String urlExtension,
    String resourceLink = '',
    Map<String, String> additionalHeader = const {},
    String? contentType,
  }) async {
    final uri = Uri.parse('$connectionUri$urlExtension');

    final headers = generateHeaders(
      resourceLink: resourceLink,
      method: 'delete',
      additionalHeader: additionalHeader,
    );

    var response = await client.delete(
      uri,
      headers: headers,
    );

    final stringRes = response.body;

    if (stringRes.isEmpty) {
      return {};
    }

    final responseMap = json.decode(stringRes);
    return responseMap;
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
    print(authHeader);
    return authHeader;
  }
}
