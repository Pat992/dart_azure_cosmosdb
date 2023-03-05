// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

/// Base-datasource that implements some basic requests and creates the header,
/// extended by other datasources
abstract class IBaseDatasource {
  /// **Description:** General GET-request.
  ///
  /// **Parameter:**
  ///
  /// String urlExtension - Extension to the base-url.
  ///
  /// String resourceLink - Resource-link added to the header if necessary.
  ///
  /// Map<String, String> additionalHeader - additional headers to add to the basic ones.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> getRequest({
    required String urlExtension,
    String resourceLink = '',
    Map<String, String> additionalHeader = const {},
  });

  /// **Description:** General POST-request.
  ///
  /// **Parameter:**
  ///
  /// String urlExtension - Extension to the base-url.
  ///
  /// Map<String, dynamic> - Body of the POST-request.
  ///
  /// List<dynamic> arrBody - In case of a stored procedure, an array body will instead be sent.
  ///
  /// String resourceLink - Resource-link added to the header if necessary.
  ///
  /// Map<String, String> additionalHeader - additional headers to add to the basic ones.
  ///
  /// String? contentType - in case of a query: application/query+json
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> postRequest({
    required String urlExtension,
    required Map<String, dynamic> body,
    List<dynamic> arrBody = const [],
    String resourceLink = '',
    Map<String, String> additionalHeader = const {},
    String? contentType,
  });

  /// **Description:** General PUT-request.
  ///
  /// **Parameter:**
  ///
  /// String urlExtension - Extension to the base-url.
  ///
  /// Map<String, dynamic> - Body of the PUT-request.
  ///
  /// String resourceLink - Resource-link added to the header if necessary.
  ///
  /// Map<String, String> additionalHeader - additional headers to add to the basic ones.
  ///
  /// String? contentType - in case of a query: application/query+json
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> putRequest({
    required String urlExtension,
    required Map<String, dynamic> body,
    String resourceLink = '',
    Map<String, String> additionalHeader = const {},
    String? contentType,
  });

  /// **Description:** General DELETE-request.
  ///
  /// **Parameter:**
  ///
  /// String urlExtension - Extension to the base-url.
  ///
  /// String resourceLink - Resource-link added to the header if necessary.
  ///
  /// Map<String, String> additionalHeader - additional headers to add to the basic ones.
  ///
  /// String? contentType - in case of a query: application/query+json
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> deleteRequest({
    required String urlExtension,
    String resourceLink = '',
    Map<String, String> additionalHeader = const {},
    String? contentType,
  });

  /// **Description:** Function to generate the headers.
  ///
  /// **Parameter:**
  ///
  /// String resourceLink - Resource-link added to the header.
  ///
  /// String method - GET, POST, PUT or DELETE.
  ///
  /// String? contentType - in case of a query: application/query+json
  ///
  /// **Returns:** Map<String, String>.
  Map<String, String> generateHeaders({
    required String resourceLink,
    required String method,
    required Map<String, String> additionalHeader,
    String? contentType,
  });

  /// **Description:** Generates the current date to create a correct token.
  ///
  /// **Returns:** String.
  String getRfc1123Date();
}
