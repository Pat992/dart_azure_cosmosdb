import 'dart:convert';
import 'dart:io';

import 'package:dart_azure_cosmosdb/src/core/auth_util.dart';
import 'package:dart_azure_cosmosdb/src/core/enum/base_enum.dart';

abstract class BaseDatasource {
  AuthUtil authUtil;
  String baseUrl = '';
  String authorizationType = '';
  String authorizationVersion = '';
  String primaryKey = '';
  ResourceType resourceType;
  String xmsVersion;
  late HttpClient client;

  BaseDatasource({
    required this.authUtil,
    required this.resourceType,
    required this.xmsVersion,
    this.baseUrl = '',
    this.authorizationType = '',
    this.authorizationVersion = '',
    this.primaryKey = '',
  });

  Future<Map<String, dynamic>> getRequest({
    required String urlExtension,
    String resourceLink = '',
    Map<String, String> additionalHeader = const {},
  }) async {
    try {
      client = HttpClient();

      final uri = '$baseUrl$urlExtension';

      final header = generateHeader(
        resourceLink: resourceLink,
        method: 'get',
        additionalHeader: additionalHeader,
      );

      final request = await createGetOrDeleteRequest(
        uri: uri,
        header: header,
        isGet: true,
      );
      final response = await request.close();

      client.close(force: true);

      final stringRes = await readResponse(response: response);
      final responseMap = json.decode(stringRes);

      return responseMap;
    } on SocketException catch (e) {
      return {
        'code': 'socket_exception',
        'message': e.message,
        'status': 1,
      };
    } on HttpException catch (e) {
      return {
        'code': 'http_exception',
        'message': e.message,
        'status': 1,
      };
    } catch (e) {
      return {
        'code': 'unknown_exception',
        'message': e.toString(),
        'status': 1,
      };
    }
  }

  Future<Map<String, dynamic>> postRequest({
    required String urlExtension,
    required Map<String, dynamic> body,
    List<dynamic> arrBody = const [],
    String resourceLink = '',
    Map<String, String> additionalHeader = const {},
    String? contentType,
  }) async {
    try {
      client = HttpClient();

      final uri = '$baseUrl$urlExtension';

      final header = generateHeader(
        resourceLink: resourceLink,
        method: 'post',
        additionalHeader: additionalHeader,
      );

      final request = await createPostOrPutRequest(
        uri: uri,
        header: header,
        body: arrBody.isEmpty ? body : arrBody,
        isPost: true,
      );
      final response = await request.close();

      client.close(force: true);

      final stringRes = await readResponse(response: response);
      final responseMap = json.decode(stringRes);

      return responseMap;
    } on SocketException catch (e) {
      return {
        'code': 'socket_exception',
        'message': e.message,
        'status': 1,
      };
    } on HttpException catch (e) {
      return {
        'code': 'http_exception',
        'message': e.message,
        'status': 1,
      };
    } catch (e) {
      return {
        'code': 'unknown_exception',
        'message': e.toString(),
        'status': 1,
      };
    }
  }

  Future<Map<String, dynamic>> putRequest({
    required String urlExtension,
    required Map<String, dynamic> body,
    String resourceLink = '',
    Map<String, String> additionalHeader = const {},
    String? contentType,
  }) async {
    try {
      client = HttpClient();

      final uri = '$baseUrl$urlExtension';

      final header = generateHeader(
        resourceLink: resourceLink,
        method: 'put',
        additionalHeader: additionalHeader,
      );

      final request = await createPostOrPutRequest(
        uri: uri,
        header: header,
        body: body,
        isPost: false,
      );
      final response = await request.close();

      client.close(force: true);

      final stringRes = await readResponse(response: response);
      final responseMap = json.decode(stringRes);

      return responseMap;
    } on SocketException catch (e) {
      return {
        'code': 'socket_exception',
        'message': e.message,
        'status': 1,
      };
    } on HttpException catch (e) {
      return {
        'code': 'http_exception',
        'message': e.message,
        'status': 1,
      };
    } catch (e) {
      return {
        'code': 'unknown_exception',
        'message': e.toString(),
        'status': 1,
      };
    }
  }

  Future<Map<String, dynamic>> deleteRequest({
    required String urlExtension,
    String resourceLink = '',
    Map<String, String> additionalHeader = const {},
    String? contentType,
  }) async {
    try {
      client = HttpClient();

      final uri = '$baseUrl$urlExtension';

      final header = generateHeader(
        resourceLink: resourceLink,
        method: 'delete',
        additionalHeader: additionalHeader,
      );

      final request = await createGetOrDeleteRequest(
        uri: uri,
        header: header,
        isGet: false,
      );
      final response = await request.close();

      client.close(force: true);

      final stringRes = await readResponse(response: response);
      final responseMap = json.decode(stringRes);

      return responseMap;
    } on SocketException catch (e) {
      return {
        'code': 'socket_exception',
        'message': e.message,
        'status': 1,
      };
    } on HttpException catch (e) {
      return {
        'code': 'http_exception',
        'message': e.message,
        'status': 1,
      };
    } catch (e) {
      return {
        'code': 'unknown_exception',
        'message': e.toString(),
        'status': 1,
      };
    }
  }

  Future<HttpClientRequest> createGetOrDeleteRequest({
    required String uri,
    required Map<String, String> header,
    required bool isGet,
  }) async {
    HttpClientRequest request;
    if (isGet) {
      request = await client.getUrl(Uri.parse(uri));
    } else {
      request = await client.deleteUrl(Uri.parse(uri));
    }

    header.forEach((key, value) {
      request.headers.set(key, value);
    });

    return request;
  }

  Future<HttpClientRequest> createPostOrPutRequest({
    required String uri,
    required Map<String, String> header,
    required Object body,
    required bool isPost,
  }) async {
    HttpClientRequest request;

    if (isPost) {
      request = await client.postUrl(Uri.parse(uri));
    } else {
      request = await client.putUrl(Uri.parse(uri));
    }

    header.forEach((key, value) {
      request.headers.set(key, value);
    });

    request.write(body);

    return request;
  }

  Future<HttpClientRequest> createPutRequest({
    required String uri,
    required Map<String, String> header,
    required Object body,
  }) async {
    final request = await client.putUrl(Uri.parse(uri));

    header.forEach((key, value) {
      request.headers.set(key, value);
    });

    request.write(body);

    return request;
  }

  Future<String> readResponse({
    required HttpClientResponse response,
  }) async {
    final contents = StringBuffer();
    await for (var data in response.transform(utf8.decoder)) {
      contents.write(data);
    }
    return contents.toString();
  }

  Map<String, String> generateHeader({
    required String resourceLink,
    required String method,
    required Map<String, String> additionalHeader,
    String? contentType,
  }) {
    final utcString = getRfc1123Date();
    final authHeader = authUtil.getHeader(
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

  String getRfc1123Date() {
    return HttpDate.format(DateTime.now().toUtc());
  }
}
