import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/core/auth_util.dart';
import 'package:dart_azure_cosmosdb/src/core/date_util.dart';
import 'package:dart_azure_cosmosdb/src/domain/repositories/i_user_repository.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/user_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/repositories/user_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../fixtures/fixture_reader.dart';
import 'base_datasource_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  final authUtil = AuthUtil();
  final dateUtil = DateUtil();
  late IUserRepository userRepository;
  late MockClient mockClient;
  final uriString = 'https://cosmosdb-test.com';
  String pk =
      'BHipJo/AFw5lUZ6v/dOzQF2RPAbS9WQ9QbiFkjhOWNLOTk9LWL/Sm16/ZySbCmBH9bFl4pvLS+egQC0S6cIioA==';

  setUp(() {
    mockClient = MockClient();

    userRepository = UserRepository(
      userDatasource: UserDatasource(
        client: mockClient,
        authUtil: authUtil,
        xmsVersion: '2018-12-31',
        connectionUri: uriString,
        authorizationType: 'master',
        authorizationVersion: '1.0',
        primaryKey: pk,
        dateUtil: dateUtil,
      ),
    );
  });

  // helper
  void setUpGetResponse(String urlExtension) {
    Uri uri = Uri.parse('$uriString$urlExtension');

    switch (urlExtension) {
      case '/dbs/testDb/users':
        when(mockClient.get(uri, headers: anyNamed("headers"))).thenAnswer(
            (_) async => http.Response(fixture('user-list-success.json'), 200));
        break;
      case '/dbs/testDb/users/testUser':
        when(mockClient.get(uri, headers: anyNamed("headers"))).thenAnswer(
            (_) async => http.Response(fixture('user-success.json'), 200));
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
      case '/dbs/testDb/users':
        when(mockClient.post(uri,
                headers: anyNamed("headers"), body: anyNamed('body')))
            .thenAnswer(
                (_) async => http.Response(fixture('user-success.json'), 200));
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
      case '/dbs/testDb/users/testUser':
        when(mockClient.put(uri,
                headers: anyNamed("headers"), body: anyNamed('body')))
            .thenAnswer(
                (_) async => http.Response(fixture('user-success.json'), 200));
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
      case '/dbs/testDb/users/testUser':
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
      final resMap = json.decode(fixture('user-list-success.json'));
      setUpGetResponse('/dbs/testDb/users');

      // act
      final res = await userRepository.list(
        dbId: 'testDb',
      );

      // assert
      expect(res.error.isEmpty, true);
      expect(res.toMap(), resMap);
    });

    test('Check if .get is building a correct url and returning a correct map',
        () async {
      // arrange
      final resMap = json.decode(fixture('user-success.json'));
      setUpGetResponse('/dbs/testDb/users/testUser');

      // act
      final res = await userRepository.get(
        dbId: 'testDb',
        userId: 'testUser',
      );

      // assert
      expect(res.error.isEmpty, true);
      expect(res.toMap(), resMap);
    });

    test(
        'Check if .get is building a correct url (in an error case) and returning a correct map',
        () async {
      // arrange
      final resMap = json.decode(fixture('general-error.json'));
      setUpGetResponse('/error');

      // act
      final res = await userRepository.get(
        dbId: 'error',
        userId: '',
      );

      // assert
      expect(res.error.isNotEmpty, true);
      expect(res.toMap(), resMap);
    });
  });

  group('POST', () {
    test(
        'Check if .create is building a correct url and returning a correct map',
        () async {
      // arrange
      final resMap = json.decode(fixture('user-success.json'));
      setUpPostResponse('/dbs/testDb/users');

      // act
      final res = await userRepository.create(
        dbId: 'testDb',
        userId: 'testUser',
      );

      // assert
      expect(res.error.isEmpty, true);
      expect(res.toMap(), resMap);
    });

    test(
        'Check if .create is building a correct url (in an error case) and returning a correct map',
        () async {
      // arrange
      final resMap = json.decode(fixture('general-error.json'));
      setUpPostResponse('/error');

      // act
      final res = await userRepository.create(
        dbId: 'error',
        userId: '',
      );

      // assert
      expect(res.error.isNotEmpty, true);
      expect(res.toMap(), resMap);
    });
  });

  group('PUT', () {
    test(
        'Check if .replace is building a correct url and returning a correct map',
        () async {
      // arrange
      final resMap = json.decode(fixture('user-success.json'));
      setUpPutResponse('/dbs/testDb/users/testUser');

      // act
      final res = await userRepository.replace(
        dbId: 'testDb',
        userId: 'testUser',
        newUserId: 'newTestUser',
      );

      // assert
      expect(res.error.isEmpty, true);
      expect(res.toMap(), resMap);
    });
  });

  group('DELETE', () {
    test(
        'Check if .delete is building a correct url and returning a correct map',
        () async {
      // arrange
      setUpDeleteResponse('/dbs/testDb/users/testUser');

      // act
      final res = await userRepository.delete(
        dbId: 'testDb',
        userId: 'testUser',
      );

      // assert
      expect(res.error.isEmpty, true);
      expect(res.id, 'testUser');
      expect(res.ts, 0);
    });

    test(
        'Check if .delete is building a correct url (in an error case) and returning a correct map',
        () async {
      // arrange
      final resMap = json.decode(fixture('general-error.json'));
      setUpDeleteResponse('/error');

      // act
      final res = await userRepository.delete(
        dbId: 'error',
        userId: '',
      );

      // assert
      expect(res.error.isNotEmpty, true);
      expect(res.toMap(), resMap);
    });
  });
}
