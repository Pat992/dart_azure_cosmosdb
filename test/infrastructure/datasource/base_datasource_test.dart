import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/core/auth_util.dart';
import 'package:dart_azure_cosmosdb/src/core/enum/base_enum.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/base_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_base_datasource.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../fixtures/fixture_reader.dart';
import 'base_datasource_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  final authUtil = AuthUtil();
  late IBaseDatasource baseDatasource;
  late MockClient mockClient;
  final uriString = 'https://cosmosdb-test.com';
  String pk =
      'BHipJo/AFw5lUZ6v/dOzQF2RPAbS9WQ9QbiFkjhOWNLOTk9LWL/Sm16/ZySbCmBH9bFl4pvLS+egQC0S6cIioA==';

  setUp(() {
    mockClient = MockClient();
    baseDatasource = BaseDatasource(
      client: mockClient,
      authUtil: authUtil,
      resourceType: ResourceType.dbs,
      xmsVersion: '2018-12-31',
      baseUrl: uriString,
      authorizationType: 'master',
      authorizationVersion: '1.0',
      primaryKey: pk,
    );
  });

  // helper
  void setUpResponse(String urlExtension) {
    Uri uri = Uri.parse('$uriString$urlExtension');
    switch (urlExtension) {
      case '/get/dbs':
        when(mockClient.get(uri, headers: anyNamed("headers"))).thenAnswer(
            (_) async => http.Response(fixture('base-success.json'), 200));
        break;
      case '/list/dbs':
        when(mockClient.get(uri, headers: anyNamed("headers"))).thenAnswer(
            (_) async => http.Response(fixture('base-list-success.json'), 200));
        break;
      case '/post/dbs':
        when(mockClient.post(uri,
                headers: anyNamed("headers"), body: anyNamed('body')))
            .thenAnswer(
                (_) async => http.Response(fixture('base-success.json'), 200));
        break;
      case '/put/dbs':
        when(mockClient.put(uri,
                headers: anyNamed("headers"), body: anyNamed('body')))
            .thenAnswer(
                (_) async => http.Response(fixture('base-success.json'), 200));
        break;
      case '/delete/dbs':
        when(mockClient.delete(uri, headers: anyNamed("headers")))
            .thenAnswer((_) async => http.Response('', 204));
        break;
      default:
        when(mockClient.get(uri, headers: anyNamed("headers"))).thenAnswer(
            (_) async => http.Response(fixture('general-error.json'), 400));
        break;
    }
  }

  group('GET', () {
    test(
        'Check if GET request is sent to "https://cosmosdb-test.com/get/dbs" and a map is returned',
        () async {
      // arrange
      final resMap = json.decode(fixture('base-success.json'));
      setUpResponse('/get/dbs');

      // act
      final res = await baseDatasource.getRequest(urlExtension: '/get/dbs');

      // assert
      expect(res, resMap);
    });

    test(
        'Check if GET request is sent to "https://cosmosdb-test.com/list/dbs" and a list-map is returned',
        () async {
      // arrange
      final resMap = json.decode(fixture('base-list-success.json'));
      setUpResponse('/list/dbs');

      // act
      final res = await baseDatasource.getRequest(urlExtension: '/list/dbs');

      // assert
      expect(res, resMap);
    });

    test(
        'Check if GET request is sent to "https://cosmosdb-test.com/error/dbs" and a error-map is returned',
        () async {
      // arrange
      final resMap = json.decode(fixture('general-error.json'));
      setUpResponse('/error/dbs');

      // act
      final res = await baseDatasource.getRequest(urlExtension: '/error/dbs');

      // assert
      expect(res, resMap);
    });
  });

  group('POST', () {
    test(
        'Check if POST request is sent to "https://cosmosdb-test.com/post/dbs" and a map is returned',
        () async {
      // arrange
      final resMap = json.decode(fixture('base-success.json'));
      setUpResponse('/post/dbs');

      // act
      final res =
          await baseDatasource.postRequest(urlExtension: '/post/dbs', body: {});

      // assert
      expect(res, resMap);
    });
  });

  group('PUT', () {
    test(
        'Check if DELETE request is sent to "https://cosmosdb-test.com/put/dbs" and an empty map is returned',
        () async {
      // arrange
      final resMap = json.decode(fixture('base-success.json'));
      setUpResponse('/put/dbs');

      // act
      final res =
          await baseDatasource.putRequest(urlExtension: '/put/dbs', body: {});

      // assert
      expect(res, resMap);
    });
  });

  group('DELETE', () {
    test(
        'Check if DELETE request is sent to "https://cosmosdb-test.com/delete/dbs" and an empty map is returned',
        () async {
      // arrange
      setUpResponse('/delete/dbs');

      // act
      final res =
          await baseDatasource.deleteRequest(urlExtension: '/delete/dbs');

      // assert
      expect(res, {});
    });
  });
}
