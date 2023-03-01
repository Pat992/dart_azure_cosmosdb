// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/models_barrel.dart';

abstract class IDocumentRepository {
  Future<CosmosDocumentList> list({
    required String dbId,
    required String collectionId,
  });

  Future<CosmosDocument> get({
    required String dbId,
    required String collectionId,
    required String documentId,
    required String partitionKey,
  });

  Future<CosmosDocument> create({
    required String dbId,
    required String collectionId,
    required String partitionKey,
    required Map<String, dynamic> body,
  });

  Future<CosmosDocument> delete({
    required String dbId,
    required String collectionId,
    required String documentId,
    required String partitionKey,
  });

  Future<CosmosDocument> replace({
    required String dbId,
    required String collectionId,
    required String documentId,
    required String partitionKey,
    required Map<String, dynamic> body,
  });

  Future<CosmosDocumentList> query({
    required String dbId,
    required String collectionId,
    required String query,
    List<dynamic> parameters = const [],
  });
}
