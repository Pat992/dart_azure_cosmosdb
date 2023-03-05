// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/base_model.dart';

/// A database is a logical namespace for collections, users, and permissions.
class CosmosDatabase extends Base {
  /// **Description:** It is a system generated property that specifies the addressable path of the collections resource.
  ///
  /// **Example:** 'colls/'
  String colls;

  /// **Description:** It is a system generated property that specifies the addressable path of the users resource.
  ///
  /// **Example:** 'users/'
  String users;

  /// **Description:** Creates a [CosmosDatabase] model Object.
  ///
  /// **id:** The unique user generated name for the resource.
  /// The id field must not exceed 255 characters.
  ///
  /// [Type:] String *required*
  CosmosDatabase({
    required super.id,
  })  : colls = '',
        users = '',
        super(
          rid: '',
          ts: 0,
          self: '',
          etag: '',
          error: const {},
        );

  /// **Description:** Transforms the [CosmosDatabase] model to a Map for the CosmosDB API.
  @override
  Map<String, dynamic> toMap() {
    final body = super.toMap();

    if (error.isEmpty) {
      body.addAll({
        '_colls': colls,
        '_users': users,
      });
    }

    return body;
  }

  /// **Description:** Transforms a Map from the CosmosDB API to the [CosmosDatabase] model.
  @override
  CosmosDatabase.fromMap(Map<String, dynamic> map)
      : colls = map['_colls'] ?? '',
        users = map['_users'] ?? '',
        super.fromMap(map);
}
