abstract class IBaseDatasource {
  Future<Map<String, dynamic>> getRequest({
    required String urlExtension,
    String resourceLink = '',
    Map<String, String> additionalHeader = const {},
  });

  Future<Map<String, dynamic>> postRequest({
    required String urlExtension,
    required Map<String, dynamic> body,
    List<dynamic> arrBody = const [],
    String resourceLink = '',
    Map<String, String> additionalHeader = const {},
    String? contentType,
  });

  putRequest({
    required String urlExtension,
    required Map<String, dynamic> body,
    String resourceLink = '',
    Map<String, String> additionalHeader = const {},
    String? contentType,
  });

  Future<Map<String, dynamic>> deleteRequest({
    required String urlExtension,
    String resourceLink = '',
    Map<String, String> additionalHeader = const {},
    String? contentType,
  });

  Map<String, String> generateHeaders({
    required String resourceLink,
    required String method,
    required Map<String, String> additionalHeader,
    String? contentType,
  });

  String getRfc1123Date();
}
