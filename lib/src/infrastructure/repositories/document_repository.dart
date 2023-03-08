// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/domain/repositories/i_document_repository.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_document_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/document_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/document_model.dart';

class DocumentRepository implements IDocumentRepository {
  final IDocumentDatasource documentDatasource;

  DocumentRepository({required this.documentDatasource});

  @override
  Future<CosmosDocument> create({
    required String dbId,
    required String collectionId,
    required String partitionKey,
    required Map<String, dynamic> body,
  }) async {
    try {
      final res = await documentDatasource.create(
        dbId: dbId,
        collectionId: collectionId,
        partitionKey: partitionKey,
        body: body,
      );

      return CosmosDocument.fromMap(res);
    } catch (e) {
      return CosmosDocument.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }

  @override
  Future<CosmosDocument> delete({
    required String dbId,
    required String collectionId,
    required String documentId,
    required String partitionKey,
  }) async {
    try {
      final res = await documentDatasource.delete(
        dbId: dbId,
        collectionId: collectionId,
        documentId: documentId,
        partitionKey: partitionKey,
      );

      if (res.isEmpty) {
        return CosmosDocument(id: documentId);
      }

      return CosmosDocument.fromMap(res);
    } catch (e) {
      return CosmosDocument.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }

  @override
  Future<CosmosDocument> get({
    required String dbId,
    required String collectionId,
    required String documentId,
    required String partitionKey,
  }) async {
    try {
      final res = await documentDatasource.get(
        dbId: dbId,
        collectionId: collectionId,
        documentId: documentId,
        partitionKey: partitionKey,
      );

      return CosmosDocument.fromMap(res);
    } catch (e) {
      return CosmosDocument.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }

  @override
  Future<CosmosDocumentList> list({
    required String dbId,
    required String collectionId,
  }) async {
    try {
      final res = await documentDatasource.list(
        dbId: dbId,
        collectionId: collectionId,
      );

      return CosmosDocumentList.fromMap(res);
    } catch (e) {
      return CosmosDocumentList.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }

  @override
  Future<Map<String, dynamic>> query({
    required String dbId,
    required String collectionId,
    required String query,
    List parameters = const [],
  }) async {
    try {
      final res = await documentDatasource.query(
        dbId: dbId,
        collectionId: collectionId,
        query: query,
      );

      return res;
    } catch (e) {
      return {
        'code': 'exception',
        'message': '$e',
      };
    }
  }

  @override
  Future<CosmosDocument> replace({
    required String dbId,
    required String collectionId,
    required String documentId,
    required String partitionKey,
    required Map<String, dynamic> body,
  }) async {
    try {
      final res = await documentDatasource.replace(
        dbId: dbId,
        collectionId: collectionId,
        documentId: documentId,
        partitionKey: partitionKey,
        body: body,
      );

      return CosmosDocument.fromMap(res);
    } catch (e) {
      return CosmosDocument.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }
}
