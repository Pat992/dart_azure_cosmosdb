// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/base_model.dart';

/// A user-defined function (UDF) is a side effect free piece of application logic written in JavaScript.
/// It allows developers to construct a query operator, thus extending the core of the Cosmos DB query language.
/// Like stored procedures, UDFs live in the confines of a collection, thus confining the application logic to the collection.
class UserDefinedFunction extends Base {
  /// **Description:** It is a user settable property. It is the body of the UDF.
  ///
  /// **Example:** 'function updateMetadata() { ... }'
  String body;

  /// **Description:** Creates a [UserDefinedFunction] model Object.
  ///
  /// **id:** The unique user generated name for the resource.
  /// The id field must not exceed 255 characters.
  ///
  /// [Type:] String *required*
  ///
  /// **body:** It is a user settable property. It is the body of the UDF.
  ///
  /// [Type:] String *required*
  UserDefinedFunction({
    required super.id,
    required this.body,
  }) : super(
          rid: '',
          ts: 0,
          self: '',
          etag: '',
          error: const {},
        );

  /// **Description:** Transforms the [UserDefinedFunction] model to a Map for the CosmosDB API.
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

  /// **Description:** Transforms a Map from the CosmosDB API to the [UserDefinedFunction] model.
  @override
  UserDefinedFunction.fromMap(Map<String, dynamic> map)
      : body = map['body'] ?? '',
        super.fromMap(map);
}
