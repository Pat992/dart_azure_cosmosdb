import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/core/auth_util.dart';
import 'package:dart_azure_cosmosdb/src/core/enum/base_enum.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_base_datasource.dart';
import 'package:http/http.dart' as http;

class BaseDatasource implements IBaseDatasource {
  IAuthUtil authUtil;
  final http.Client client;
  String baseUrl;
  String authorizationType;
  String authorizationVersion;
  String primaryKey;
  ResourceType resourceType;
  String xmsVersion;

  BaseDatasource({
    required this.client,
    required this.authUtil,
    required this.resourceType,
    required this.xmsVersion,
    required this.baseUrl,
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
    final uri = Uri.parse('$baseUrl$urlExtension');

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
    List<dynamic> arrBody = const [],
    String resourceLink = '',
    Map<String, String> additionalHeader = const {},
    String? contentType,
  }) async {
    final uri = Uri.parse('$baseUrl$urlExtension');

    final headers = generateHeaders(
      resourceLink: resourceLink,
      method: 'post',
      additionalHeader: additionalHeader,
    );

    var response = await client.post(
      uri,
      headers: headers,
      body: arrBody.isEmpty ? body : arrBody,
    );

    final stringRes = response.body;
    final responseMap = json.decode(stringRes);

    return responseMap;
  }

  @override
  Future<Map<String, dynamic>> putRequest({
    required String urlExtension,
    required Map<String, dynamic> body,
    String resourceLink = '',
    Map<String, String> additionalHeader = const {},
    String? contentType,
  }) async {
    final uri = Uri.parse('$baseUrl$urlExtension');

    final headers = generateHeaders(
      resourceLink: resourceLink,
      method: 'put',
      additionalHeader: additionalHeader,
    );

    var response = await client.put(
      uri,
      headers: headers,
      body: body,
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
    final uri = Uri.parse('$baseUrl$urlExtension');

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
    final utcString = getRfc1123Date();
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

  @override
  String getRfc1123Date() {
    return DateTime.now().toUtc().toIso8601String();
  }
}
