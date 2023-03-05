import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/core/auth_util.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/database_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_database_datasource.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../fixtures/fixture_reader.dart';
import 'base_datasource_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  final authUtil = AuthUtil();
  late IDatabaseDatasource databaseDatasource;
  late MockClient mockClient;
  final uriString = 'https://cosmosdb-test.com';
  String pk =
      'BHipJo/AFw5lUZ6v/dOzQF2RPAbS9WQ9QbiFkjhOWNLOTk9LWL/Sm16/ZySbCmBH9bFl4pvLS+egQC0S6cIioA==';

  setUp(() {
    mockClient = MockClient();

    databaseDatasource = DatabaseDatasource(
      client: mockClient,
      authUtil: authUtil,
      xmsVersion: '2018-12-31',
      connectionUri: uriString,
      authorizationType: 'master',
      authorizationVersion: '1.0',
      primaryKey: pk,
    );
  });

  // helper
  void setUpGetResponse(String urlExtension) {
    Uri uri = Uri.parse('$uriString$urlExtension');

    switch (urlExtension) {
      case '/dbs':
        when(mockClient.get(uri, headers: anyNamed("headers"))).thenAnswer(
            (_) async =>
                http.Response(fixture('database-list-success.json'), 200));
        break;
      case '/dbs/testDb':
        when(mockClient.get(uri, headers: anyNamed("headers"))).thenAnswer(
            (_) async => http.Response(fixture('database-success.json'), 200));
        break;
      default:
        when(mockClient.get(any, headers: anyNamed("headers"))).thenAnswer(
            (_) async => http.Response(fixture('general-error.json'), 400));
        break;
    }
  }

  setUpPostResponse(String urlExtension) {
    Uri uri = Uri.parse('$uriString$urlExtension');

    switch (urlExtension) {
      case '/dbs':
        when(mockClient.post(uri,
                headers: anyNamed("headers"), body: anyNamed('body')))
            .thenAnswer((_) async =>
                http.Response(fixture('database-success.json'), 200));
        break;
      default:
        when(mockClient.post(any,
                headers: anyNamed("headers"), body: anyNamed('body')))
            .thenAnswer(
                (_) async => http.Response(fixture('general-error.json'), 400));
        break;
    }
  }

  setUpDeleteResponse(String urlExtension) {
    Uri uri = Uri.parse('$uriString$urlExtension');

    switch (urlExtension) {
      case '/dbs/testDb':
        when(mockClient.delete(uri, headers: anyNamed("headers")))
            .thenAnswer((_) async => http.Response('', 204));
        break;
      default:
        when(mockClient.delete(any, headers: anyNamed("headers"))).thenAnswer(
            (_) async => http.Response(fixture('general-error.json'), 400));
        break;
    }
  }

  group('GET', () {
    test('Check if .list is building a correct url and returning a correct map',
        () async {
      // arrange
      final resMap = json.decode(fixture('database-list-success.json'));
      setUpGetResponse('/dbs');

      // act
      final res = await databaseDatasource.list();

      // assert
      expect(res, resMap);
    });

    test('Check if .get is building a correct url and returning a correct map',
        () async {
      // arrange
      final resMap = json.decode(fixture('database-success.json'));
      setUpGetResponse('/dbs/testDb');

      // act
      final res = await databaseDatasource.get(dbId: 'testDb');

      // assert
      expect(res, resMap);
    });

    test(
        'Check if .get is building a correct url (in an error case) and returning a correct map',
        () async {
      // arrange
      final resMap = json.decode(fixture('general-error.json'));
      setUpGetResponse('/error');

      // act
      final res = await databaseDatasource.get(dbId: 'error');

      // assert
      expect(res, resMap);
    });
  });

  group('POST', () {
    test(
        'Check if .create is building a correct url and returning a correct map',
        () async {
      // arrange
      final resMap = json.decode(fixture('database-success.json'));
      setUpPostResponse('/dbs');

      // act
      final res = await databaseDatasource.create(dbId: 'testDb');

      // assert
      expect(res, resMap);
    });

    test(
        'Check if .create is building a correct url (in an error case) and returning a correct map',
        () async {
      // arrange
      final resMap = json.decode(fixture('general-error.json'));
      setUpPostResponse('/error');

      // act
      final res = await databaseDatasource.create(dbId: 'error');

      // assert
      expect(res, resMap);
    });
  });

  group('DELETE', () {
    test(
        'Check if .delete is building a correct url and returning a correct map',
        () async {
      // arrange
      setUpDeleteResponse('/dbs/testDb');

      // act
      final res = await databaseDatasource.delete(dbId: 'testDb');

      // assert
      expect(res, {});
    });

    test(
        'Check if .delete is building a correct url (in an error case) and returning a correct map',
        () async {
      // arrange
      final resMap = json.decode(fixture('general-error.json'));
      setUpDeleteResponse('/error');

      // act
      final res = await databaseDatasource.delete(dbId: 'error');

      // assert
      expect(res, resMap);
    });
  });
}
