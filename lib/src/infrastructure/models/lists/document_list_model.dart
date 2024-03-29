// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/base_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/document_model.dart';

/// A list of CosmosDB documents.
class CosmosDocumentList extends BaseList {
  /// **Description:** A list of CosmosDB documents.
  ///
  /// **Example:** [[]]
  List<CosmosDocument> documents = [];

  /// **Description:** Creates a [CosmosDocumentList] model Object.
  ///
  /// **documents:** A list of CosmosDB documents.
  ///
  /// [Type:] List<CosmosDocument> *optional*
  ///
  /// [Default value:] const [[]]
  CosmosDocumentList({
    this.documents = const [],
  }) : super(
          error: const {},
          rid: '',
          count: 0,
        );

  /// **Description:** Transforms the [CosmosDocumentList] model to a Map for the CosmosDB API.
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

  /// **Description:** Transforms a Map from the CosmosDB API to the [CosmosDocumentList] model.
  @override
  CosmosDocumentList.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    if (map.containsKey('Documents')) {
      for (final document in map['Documents']) {
        documents.add(CosmosDocument.fromMap(document));
      }
    }
  }
}
