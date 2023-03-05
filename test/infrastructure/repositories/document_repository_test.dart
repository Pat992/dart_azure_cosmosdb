import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/core/auth_util.dart';
import 'package:dart_azure_cosmosdb/src/domain/repositories/i_document_repository.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/document_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/repositories/document_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../fixtures/fixture_reader.dart';
import 'base_datasource_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  final authUtil = AuthUtil();
  late IDocumentRepository documentRepository;
  late MockClient mockClient;
  final uriString = 'https://cosmosdb-test.com';
  String pk =
      'BHipJo/AFw5lUZ6v/dOzQF2RPAbS9WQ9QbiFkjhOWNLOTk9LWL/Sm16/ZySbCmBH9bFl4pvLS+egQC0S6cIioA==';

  setUp(() {
    mockClient = MockClient();

    documentRepository = DocumentRepository(
      documentDatasource: DocumentDatasource(
        client: mockClient,
        authUtil: authUtil,
        xmsVersion: '2018-12-31',
        connectionUri: uriString,
        authorizationType: 'master',
        authorizationVersion: '1.0',
        primaryKey: pk,
      ),
    );
  });

  // helper
  void setUpGetResponse(String urlExtension) {
    Uri uri = Uri.parse('$uriString$urlExtension');

    switch (urlExtension) {
      case '/dbs/testDb/colls/testColl/docs':
        when(mockClient.get(uri, headers: anyNamed("headers"))).thenAnswer(
            (_) async =>
                http.Response(fixture('document-list-success.json'), 200));
        break;
      case '/dbs/testDb/colls/testColl/docs/testDoc':
        when(mockClient.get(uri, headers: anyNamed("headers"))).thenAnswer(
            (_) async => http.Response(fixture('document-success.json'), 200));
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
      case '/dbs/testDb/colls/testColl/docs':
        when(mockClient.post(uri,
                headers: anyNamed("headers"), body: anyNamed('body')))
            .thenAnswer((_) async =>
                http.Response(fixture('document-success.json'), 200));
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
      case '/dbs/testDb/colls/testColl/docs/testDoc':
        when(mockClient.put(uri,
                headers: anyNamed("headers"), body: anyNamed('body')))
            .thenAnswer((_) async =>
                http.Response(fixture('document-success.json'), 200));
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
      case '/dbs/testDb/colls/testColl/docs/testDoc':
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
      final resMap = json.decode(fixture('document-list-success.json'));
      setUpGetResponse('/dbs/testDb/colls/testColl/docs');

      // act
      final res = await documentRepository.list(
          dbId: 'testDb', collectionId: 'testColl');

      // assert
      expect(res.error.isEmpty, true);
      expect(res.toMap(), resMap);
    });

    test('Check if .get is building a correct url and returning a correct map',
        () async {
      // arrange
      final resMap = json.decode(fixture('document-success.json'));
      setUpGetResponse('/dbs/testDb/colls/testColl/docs/testDoc');

      // act
      final res = await documentRepository.get(
          dbId: 'testDb',
          collectionId: 'testColl',
          documentId: 'testDoc',
          partitionKey: 'any');

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
      final res = await documentRepository.get(
        dbId: 'error',
        partitionKey: '',
        collectionId: '',
        documentId: '',
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
      final resMap = json.decode(fixture('document-success.json'));
      setUpPostResponse('/dbs/testDb/colls/testColl/docs');

      // act
      final res = await documentRepository.create(
        dbId: 'testDb',
        collectionId: 'testColl',
        partitionKey: '',
        body: {},
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
      final res = await documentRepository.create(
        dbId: 'error',
        body: {},
        partitionKey: '',
        collectionId: '',
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
      final resMap = json.decode(fixture('document-success.json'));
      setUpPutResponse('/dbs/testDb/colls/testColl/docs/testDoc');

      // act
      final res = await documentRepository.replace(
          dbId: 'testDb',
          collectionId: 'testColl',
          documentId: 'testDoc',
          partitionKey: '',
          body: {});

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
      setUpDeleteResponse('/dbs/testDb/colls/testColl/docs/testDoc');

      // act
      final res = await documentRepository.delete(
        dbId: 'testDb',
        partitionKey: '',
        collectionId: 'testColl',
        documentId: 'testDoc',
      );

      // assert
      expect(res.error.isEmpty, true);
      expect(res.id, 'testDoc');
      expect(res.ts, 0);
    });

    test(
        'Check if .delete is building a correct url (in an error case) and returning a correct map',
        () async {
      // arrange
      final resMap = json.decode(fixture('general-error.json'));
      setUpDeleteResponse('/error');

      // act
      final res = await documentRepository.delete(
        dbId: 'error',
        documentId: '',
        collectionId: '',
        partitionKey: '',
      );

      // assert
      expect(res.error.isNotEmpty, true);
      expect(res.toMap(), resMap);
    });
  });
}
