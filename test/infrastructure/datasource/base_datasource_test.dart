import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/core/auth_util.dart';
import 'package:dart_azure_cosmosdb/src/core/enum/base_enum.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/base_datasource.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../fixtures/fixture_reader.dart';
import 'base_datasource_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  final authUtil = AuthUtil();
  late BaseDatasource baseDatasource;
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
  void setUpMockResponseSuccessSingle200() {
    // arrange
    when(mockClient.get(any, headers: anyNamed("headers"))).thenAnswer(
        (_) async => http.Response(fixture('base-success.json'), 200));
  }

  void setUpMockResponseSuccessList200() {
    // arrange
    when(mockClient.get(any, headers: anyNamed("headers"))).thenAnswer(
        (_) async => http.Response(fixture('base-list-success.json'), 200));
  }

  void setUpMockGeneralFailure400() {
    // arrange
    when(mockClient.get(any, headers: anyNamed("headers"))).thenAnswer(
        (_) async => http.Response(fixture('general-error.json'), 400));
  }

  group('GET', () {
    test(
        'Check if GET request is sent to "https://cosmosdb-test.com/dbs/test" and a map is returned',
        () async {
      // arrange
      final resMap = json.decode(fixture('base-success.json'));
      setUpMockResponseSuccessSingle200();

      // act
      final res = await baseDatasource.getRequest(urlExtension: '/dbs/test');

      // assert
      expect(res, resMap);
    });

    test(
        'Check if GET request is sent to "https://cosmosdb-test.com/dbs/test" and a map with a list is returned',
        () async {
      // arrange
      final resMap = json.decode(fixture('base-list-success.json'));
      setUpMockResponseSuccessList200();

      // act
      final res = await baseDatasource.getRequest(urlExtension: '/dbs');

      // assert
      expect(res, resMap);
    });

    test(
        'Check if GET request is sent to "https://cosmosdb-test.com/dbs/test" and a error-map is returned',
        () async {
      // arrange
      final resMap = json.decode(fixture('general-error.json'));
      setUpMockGeneralFailure400();

      // act
      final res = await baseDatasource.getRequest(urlExtension: '/dbs/test');

      // assert
      expect(res, resMap);
    });
  });
}
