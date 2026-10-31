import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/core/auth_util.dart';
import 'package:dart_azure_cosmosdb/src/core/date_util.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/database_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_database_datasource.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../fixtures/fixture_reader.dart';
import 'base_datasource_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  final authUtil = AuthUtil();
  final dateUtil = DateUtil();
  late IDatabaseDatasource databaseDatasource;
  late MockDio mockClient;
  final uriString = 'https://cosmosdb-test.com';
  String pk =
      'BHipJo/AFw5lUZ6v/dOzQF2RPAbS9WQ9QbiFkjhOWNLOTk9LWL/Sm16/ZySbCmBH9bFl4pvLS+egQC0S6cIioA==';

  setUp(() {
    mockClient = MockDio();

    databaseDatasource = DatabaseDatasource(
      client: mockClient,
      authUtil: authUtil,
      xmsVersion: '2018-12-31',
      connectionUri: uriString,
      authorizationType: 'master',
      authorizationVersion: '1.0',
      primaryKey: pk,
      dateUtil: dateUtil,
    );
  });

  // helper
  void setUpGetResponse(String urlExtension) {
    final uri = '$uriString$urlExtension';

    Response<dynamic> response({
      required String path,
      dynamic data,
      int statusCode = 200,
    }) {
      return Response<dynamic>(
        requestOptions: RequestOptions(path: path),
        data: data,
        statusCode: statusCode,
      );
    }

    switch (urlExtension) {
      case '/dbs':
        when(mockClient.get<dynamic>(
          uri,
          options: anyNamed('options'),
        )).thenAnswer((_) async => response(
              path: uri,
              data: json.decode(fixture('database-list-success.json')),
            ));
        break;

      case '/dbs/testDb':
        when(mockClient.get<dynamic>(
          uri,
          options: anyNamed('options'),
        )).thenAnswer((_) async => response(
              path: uri,
              data: json.decode(fixture('database-success.json')),
            ));
        break;

      default:
        when(mockClient.get<dynamic>(
          any,
          options: anyNamed('options'),
        )).thenAnswer((_) async => response(
              path: uri,
              data: json.decode(fixture('general-error.json')),
              statusCode: 400,
            ));
        break;
    }
  }

  void setUpPostResponse(String urlExtension) {
    final uri = '$uriString$urlExtension';

    Response<dynamic> response({
      required String path,
      dynamic data,
      int statusCode = 200,
    }) {
      return Response<dynamic>(
        requestOptions: RequestOptions(path: path),
        data: data,
        statusCode: statusCode,
      );
    }

    switch (urlExtension) {
      case '/dbs':
        when(mockClient.post<dynamic>(
          uri,
          data: anyNamed('data'),
          options: anyNamed('options'),
        )).thenAnswer((_) async => response(
              path: uri,
              data: json.decode(fixture('database-success.json')),
            ));
        break;

      default:
        when(mockClient.post<dynamic>(
          any,
          data: anyNamed('data'),
          options: anyNamed('options'),
        )).thenAnswer((_) async => response(
              path: uri,
              data: json.decode(fixture('general-error.json')),
              statusCode: 400,
            ));
        break;
    }
  }

  void setUpDeleteResponse(String urlExtension) {
    final uri = '$uriString$urlExtension';

    Response<dynamic> response({
      required String path,
      dynamic data,
      int statusCode = 200,
    }) {
      return Response<dynamic>(
        requestOptions: RequestOptions(path: path),
        data: data,
        statusCode: statusCode,
      );
    }

    switch (urlExtension) {
      case '/dbs/testDb':
        when(mockClient.delete<dynamic>(
          uri,
          options: anyNamed('options'),
        )).thenAnswer((_) async => response(
              path: uri,
              statusCode: 204,
            ));
        break;

      default:
        when(mockClient.delete<dynamic>(
          any,
          options: anyNamed('options'),
        )).thenAnswer((_) async => response(
              path: uri,
              data: json.decode(fixture('general-error.json')),
              statusCode: 400,
            ));
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
