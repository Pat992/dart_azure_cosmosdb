import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/core/auth_util.dart';
import 'package:dart_azure_cosmosdb/src/core/core_barrel.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_permission_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/permission_datasource.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../fixtures/fixture_reader.dart';
import 'base_datasource_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  final authUtil = AuthUtil();
  late IPermissionDatasource permissionDatasource;
  late MockClient mockClient;
  final uriString = 'https://cosmosdb-test.com';
  String pk =
      'BHipJo/AFw5lUZ6v/dOzQF2RPAbS9WQ9QbiFkjhOWNLOTk9LWL/Sm16/ZySbCmBH9bFl4pvLS+egQC0S6cIioA==';

  setUp(() {
    mockClient = MockClient();

    permissionDatasource = PermissionDatasource(
      client: mockClient,
      authUtil: authUtil,
      xmsVersion: '2018-12-31',
      baseUrl: uriString,
      authorizationType: 'master',
      authorizationVersion: '1.0',
      primaryKey: pk,
    );
  });

  // helper
  void setUpGetResponse(String urlExtension) {
    Uri uri = Uri.parse('$uriString$urlExtension');

    switch (urlExtension) {
      case '/dbs/testDb/users/testUser/permissions':
        when(mockClient.get(uri, headers: anyNamed("headers"))).thenAnswer(
            (_) async =>
                http.Response(fixture('permission-list-success.json'), 200));
        break;
      case '/dbs/testDb/users/testUser/permissions/testPer':
        when(mockClient.get(uri, headers: anyNamed("headers"))).thenAnswer(
            (_) async =>
                http.Response(fixture('permission-success.json'), 200));
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
      case '/dbs/testDb/users/testUser/permissions':
        when(mockClient.post(uri,
                headers: anyNamed("headers"), body: anyNamed('body')))
            .thenAnswer((_) async =>
                http.Response(fixture('permission-success.json'), 200));
        break;
      default:
        when(mockClient.post(any,
                headers: anyNamed("headers"), body: anyNamed('body')))
            .thenAnswer(
                (_) async => http.Response(fixture('general-error.json'), 400));
        break;
    }
  }

  setUpPutResponse(String urlExtension) {
    Uri uri = Uri.parse('$uriString$urlExtension');

    switch (urlExtension) {
      case '/dbs/testDb/users/testUser/permissions/testPer':
        when(mockClient.put(uri,
                headers: anyNamed("headers"), body: anyNamed('body')))
            .thenAnswer((_) async =>
                http.Response(fixture('permission-success.json'), 200));
        break;
      default:
        when(mockClient.put(any,
                headers: anyNamed("headers"), body: anyNamed('body')))
            .thenAnswer(
                (_) async => http.Response(fixture('general-error.json'), 400));
        break;
    }
  }

  setUpDeleteResponse(String urlExtension) {
    Uri uri = Uri.parse('$uriString$urlExtension');

    switch (urlExtension) {
      case '/dbs/testDb/users/testUser/permissions/testPer':
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
      final resMap = json.decode(fixture('permission-list-success.json'));
      setUpGetResponse('/dbs/testDb/users/testUser/permissions');

      // act
      final res = await permissionDatasource.list(
        dbId: 'testDb',
        userId: 'testUser',
      );

      // assert
      expect(res, resMap);
    });

    test('Check if .get is building a correct url and returning a correct map',
        () async {
      // arrange
      final resMap = json.decode(fixture('permission-success.json'));
      setUpGetResponse('/dbs/testDb/users/testUser/permissions/testPer');

      // act
      final res = await permissionDatasource.get(
        dbId: 'testDb',
        permissionId: 'testPer',
        userId: 'testUser',
      );

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
      final res = await permissionDatasource.get(
        dbId: 'error',
        permissionId: '',
        userId: '',
      );

      // assert
      expect(res, resMap);
    });
  });

  group('POST', () {
    test(
        'Check if .create is building a correct url and returning a correct map',
        () async {
      // arrange
      final resMap = json.decode(fixture('permission-success.json'));
      setUpPostResponse('/dbs/testDb/users/testUser/permissions');

      // act
      final res = await permissionDatasource.create(
        dbId: 'testDb',
        collectionId: 'testColl',
        permissionId: 'testPer',
        permissionMode: PermissionMode.all,
        userId: 'testUser',
      );

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
      final res = await permissionDatasource.create(
        dbId: 'error',
        permissionId: '',
        permissionMode: PermissionMode.all,
        userId: '',
        collectionId: '',
      );

      // assert
      expect(res, resMap);
    });
  });

  group('PUT', () {
    test(
        'Check if .replace is building a correct url and returning a correct map',
        () async {
      // arrange
      final resMap = json.decode(fixture('permission-success.json'));
      setUpPutResponse('/dbs/testDb/users/testUser/permissions/testPer');

      // act
      final res = await permissionDatasource.replace(
        dbId: 'testDb',
        collectionId: 'testColl',
        permissionMode: PermissionMode.all,
        permissionId: 'testPer',
        newPermissionId: 'newTestPer',
        userId: 'testUser',
      );

      // assert
      expect(res, resMap);
    });
  });

  group('DELETE', () {
    test(
        'Check if .delete is building a correct url and returning a correct map',
        () async {
      // arrange
      setUpDeleteResponse('/dbs/testDb/users/testUser/permissions/testPer');

      // act
      final res = await permissionDatasource.delete(
        dbId: 'testDb',
        permissionId: 'testPer',
        userId: 'testUser',
      );

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
      final res = await permissionDatasource.delete(
        dbId: 'error',
        userId: '',
        permissionId: '',
      );

      // assert
      expect(res, resMap);
    });
  });
}
