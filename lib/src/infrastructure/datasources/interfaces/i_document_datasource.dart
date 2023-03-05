// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
abstract class IDocumentDatasource {
  Future<Map<String, dynamic>> list({
    required String dbId,
    required String collectionId,
  });

  Future<Map<String, dynamic>> get({
    required String dbId,
    required String collectionId,
    required String documentId,
    required String partitionKey,
  });

  Future<Map<String, dynamic>> create({
    required String dbId,
    required String collectionId,
    required String partitionKey,
    required Map<String, dynamic> body,
  });

  Future<Map<String, dynamic>> delete({
    required String dbId,
    required String collectionId,
    required String documentId,
    required String partitionKey,
  });

  Future<Map<String, dynamic>> replace({
    required String dbId,
    required String collectionId,
    required String documentId,
    required String partitionKey,
    required Map<String, dynamic> body,
  });

  Future<Map<String, dynamic>> query({
    required String dbId,
    required String collectionId,
    required String query,
    List<dynamic> parameters = const [],
  });
}
