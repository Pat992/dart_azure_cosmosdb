// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/base_model.dart';

/// The document resource is represented by docs in the Azure Cosmos DB resource model.
/// A document consists of user-defined content in JSON format.
/// Aside from the required ID property, users can define any arbitrary elements, structures, and hierarchies for the content.
/// The ID element is a unique string that is user-settable and must not exceed 255 characters.
/// You can insert, replace, delete, read, enumerate, and query arbitrary JSON documents in a collection.
class CosmosDocument extends Base {
  /// **Description:** Any map of key-value pairs to save or retrieve in a document.
  ///
  /// **Example:** { "Volcano Name": "Agua de Pau", "Country": "Portugal", "Region": "Azores", "Elevation": 947 }
  Map<String, dynamic> values;

  /// **Description:** It is a system generated property that specifies the addressable path for the attachments resource.
  ///
  /// **Example:** 'attachments/'
  String attachments;

  /// **Description:** Creates a [CosmosDocument] model Object.
  ///
  /// **id:** The unique user generated name for the resource.
  /// The id field must not exceed 255 characters.
  ///
  /// [Type:] String *required*
  ///
  /// **values:** Any map of key-value pairs to save in a document.
  ///
  /// [Type:] Map<String, dynamic> *optional*
  ///
  /// [Default value:] {}
  CosmosDocument({
    required super.id,
    this.values = const {},
  })  : attachments = '',
        super(
          rid: '',
          ts: 0,
          self: '',
          etag: '',
          error: const {},
        );

  /// **Description:** Transforms the [CosmosDocument] model to a Map for the CosmosDB API.
  @override
  Map<String, dynamic> toMap() {
    if (error.isEmpty) {
      final body = values;
      if (attachments.isNotEmpty) {
        body.remove('_attachments');
        body.addAll({
          '_attachments': attachments,
        });
      }

      final baseBody = super.toMap();

      body.addAll(baseBody);
      return body;
    }
    final body = super.toMap();
    return body;
  }

  /// **Description:** Transforms a Map from the CosmosDB API to the [CosmosDocument] model.
  @override
  CosmosDocument.fromMap(Map<String, dynamic> map)
      : values = map,
        attachments = map['_attachments'] ?? '',
        super.fromMap(map) {
    values.remove('_attachments');
  }
}
