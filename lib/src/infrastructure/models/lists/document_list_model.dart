// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/base_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/document_model.dart';

class CosmosDocumentList extends BaseList {
  List<CosmosDocument> documents = [];

  CosmosDocumentList({
    this.documents = const [],
    super.error = const {},
    super.rid = '',
    super.count = 0,
  });

  @override
  Map<String, dynamic> toMap() {
    var body = super.toMap();

    if (error.isEmpty) {
      body.addAll({
        'Documents': documents.map((document) => document.toMap()).toList()
      });
    }

    return body;
  }

  @override
  CosmosDocumentList.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    if (map.containsKey('Documents')) {
      for (final document in map['Documents']) {
        documents.add(CosmosDocument.fromMap(document));
      }
    }
  }
}
