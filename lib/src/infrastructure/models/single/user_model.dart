// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/base_model.dart';

/// A user is a logical namespace for scoping permissions on collections, documents, attachment, stored procedures, triggers, and user-defined functions.
/// The user construct lives under a database resource and thus cannot cross the database boundary it is under.
/// The user resource is represented by users in the Azure Cosmos DB REST resource model.
/// It is a system resource, and thus contains a fixed schema.
class User extends Base {
  /// **Description:** It is a system generated property denoting the addressable path of the feed of permissions resource.
  ///
  /// **Example:** 'permissions\/'
  String permissions;

  /// **Description:** Creates a [User] model Object.
  ///
  /// **id:** It is the only user settable property.
  /// It is a unique name that identifies a user, that is, no two users share the same ID within a database.
  /// The name must not exceed 255 characters.
  ///
  /// [Type:] String *required*
  User({
    required super.id,
  })  : permissions = '',
        super(
          rid: '',
          ts: 0,
          self: '',
          etag: '',
          error: const {},
        );

  /// **Description:** Transforms the [User] model to a Map for the CosmosDB API.
  @override
  Map<String, dynamic> toMap() {
    final body = super.toMap();

    if (error.isEmpty) {
      body.addAll({
        '_permissions': permissions,
      });
    }

    return body;
  }

  /// **Description:** Transforms a Map from the CosmosDB API to the [User] model.
  @override
  User.fromMap(Map<String, dynamic> map)
      : permissions = map['_permissions'] ?? '',
        super.fromMap(map);
}
