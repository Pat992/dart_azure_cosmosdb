// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/base_model.dart';

/// A stored procedure is a piece of application logic written in JavaScript that is registered and executed against a collection as a single transaction.
/// In Azure Cosmos DB, JavaScript is hosted in the same memory space as the database.
/// Hence, requests made within stored procedures execute in the same scope of a database session.
/// This process enables Azure Cosmos DB to guarantee ACID for all operations that are part of a single stored procedure.
class StoredProcedure extends Base {
  /// **Description:** It is a user settable property. It is the body of the stored procedure.
  ///
  /// **Example:** 'function (docToCreate, addedPropertyName, addedPropertyValue { getContext().getResponse().setBody('Hello World'); }'
  String body;

  /// **Description:** Creates a [StoredProcedure] model Object.
  ///
  /// **id:** The unique user generated name for the resource.
  /// The id field must not exceed 255 characters.
  ///
  /// [Type:] String *required*
  ///
  /// **body:** It is a user settable property. It is the body of the stored procedure.
  ///
  /// [Type:] String *required*
  StoredProcedure({
    required super.id,
    required this.body,
  }) : super(
          rid: '',
          ts: 0,
          self: '',
          etag: '',
          error: const {},
        );

  /// **Description:** Transforms the [StoredProcedure] model to a Map for the CosmosDB API.
  @override
  Map<String, dynamic> toMap() {
    final superBody = super.toMap();

    if (error.isEmpty) {
      superBody.addAll({
        'body': body,
      });
    }

    return superBody;
  }

  /// **Description:** Transforms a Map from the CosmosDB API to the [StoredProcedure] model.
  @override
  StoredProcedure.fromMap(Map<String, dynamic> map)
      : body = map['body'] ?? '',
        super.fromMap(map);
}
