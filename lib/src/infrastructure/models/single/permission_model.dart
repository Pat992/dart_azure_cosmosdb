// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/core/enum/permission_enum.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/base_model.dart';

/// A permission is an authorization token associated with a user for authorized access to a specific resource.
/// It is used to manage access to collections, documents, attachments, stored procedures, triggers, and user-defined functions for a particular user.
class Permission extends Base {
  /// **Description:** The access mode on the resource for the user: All or Read.
  /// All provides read, write, and delete access to a resource.
  /// Read restricts the user to read access on the resource.
  ///
  /// **Example:** PermissionMode.all
  PermissionMode permissionMode;

  /// **Description:** The full addressable path of the resource associated with the permission.
  ///
  /// **Example:** 'dbs/ruJjAA==/colls/ruJjAM9UnAA=/'
  String resource;

  /// **Description:** It is a system generated resource token for the particular resource and user.
  ///
  /// **Example:** 'type=resource&ver=1&sig=m32/00W65F8ADb3psljJ0g==;v0kQGihedau1pVGGQmu...'
  String token;

  /// **Description:** Creates a [Permission] model Object.
  ///
  /// **id:** The unique user generated name for the resource.
  /// The id field must not exceed 255 characters.
  ///
  /// [Type:] String *required*
  ///
  /// **permissionMode:** The access mode on the resource for the user: All or Read.
  ///
  /// [Type:] PermissionMode *required*
  ///
  /// **resource:** The full addressable path of the resource associated with the permission.
  ///
  /// [Type:] String *required*
  Permission({
    required super.id,
    required this.permissionMode,
    required this.resource,
  })  : token = '',
        super(
          rid: '',
          ts: 0,
          self: '',
          etag: '',
          error: const {},
        );

  /// **Description:** Transforms the [Permission] model to a Map for the CosmosDB API.
  @override
  Map<String, dynamic> toMap() {
    final body = super.toMap();

    if (error.isEmpty) {
      body.addAll({
        'permissionMode': permissionMode.value,
        'resource': resource,
        '_token': token,
      });
    }

    return body;
  }

  /// **Description:** Transforms a Map from the CosmosDB API to the [Permission] model.
  @override
  Permission.fromMap(Map<String, dynamic> map)
      : permissionMode = map['permissionMode'] == 'All'
            ? PermissionMode.all
            : PermissionMode.read,
        resource = map['resource'] ?? '',
        token = map['_token'] ?? '',
        super.fromMap(map);
}
