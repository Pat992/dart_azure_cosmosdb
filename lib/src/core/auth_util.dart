import 'dart:convert';

import 'package:crypto/crypto.dart';

class AuthUtil {
  Map<String, String> getHeader({
    required String authorizationType,
    required String authorizationVersion,
    required String primaryKey,
    required String resourceType,
    required String resourceLink,
    required String method,
    required String utcNow,
    required String contentType,
    String xmsVersion = '2018-12-31',
  }) {
    final authToken = _getAuthorizationToken(
      authorizationType: authorizationType,
      authorizationVersion: authorizationVersion,
      primaryKey: primaryKey,
      utcNow: utcNow,
      resourceType: resourceType,
      resourceLink: resourceLink,
      method: method,
    );
    return {
      'Accept': 'application/json',
      'x-ms-version': xmsVersion,
      'x-ms-date': utcNow,
      'Authorization': authToken,
      'Content-Type': contentType,
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    };
  }

  String _getAuthorizationToken({
    required String authorizationType,
    required String authorizationVersion,
    required String primaryKey,
    required String utcNow,
    required String resourceType,
    required String resourceLink,
    required String method,
  }) {
    final decodedPrimaryKey = base64.decode(primaryKey);
    final tokenText = utf8.encode(
        "${method.toLowerCase()}\n${resourceType.toLowerCase()}\n$resourceLink\n${utcNow.toLowerCase()}\n\n");
    final hmacSha256 = Hmac(sha256, decodedPrimaryKey);
    final digest = hmacSha256.convert(tokenText).bytes;
    final digestBase64 = base64.encode(digest);
    final tokenString = Uri.encodeComponent(
        'type=$authorizationType&ver=$authorizationVersion&sig=$digestBase64');

    return tokenString;
  }
}
