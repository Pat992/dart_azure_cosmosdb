// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/base_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/permission_model.dart';

/// A list of CosmosDB permissions.
class PermissionList extends BaseList {
  /// **Description:** A list of CosmosDB permissions.
  ///
  /// **Example:** [[]]
  List<Permission> permissions = [];

  /// **Description:** Creates a [PermissionList] model Object.
  ///
  /// **permissions:** A list of CosmosDB permissions.
  ///
  /// [Type:] List<Permission> *optional*
  ///
  /// [Default value:] const [[]]
  PermissionList({
    this.permissions = const [],
  }) : super(
          error: const {},
          rid: '',
          count: 0,
        );

  /// **Description:** Transforms the [PermissionList] model to a Map for the CosmosDB API.
  @override
  Map<String, dynamic> toMap() {
    var body = super.toMap();

    if (error.isEmpty) {
      body.addAll({
        'Permissions':
            permissions.map((permission) => permission.toMap()).toList()
      });
    }

    return body;
  }

  /// **Description:** Transforms a Map from the CosmosDB API to the [PermissionList] model.
  @override
  PermissionList.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    if (map.containsKey('Permissions')) {
      for (final permission in map['Permissions']) {
        permissions.add(Permission.fromMap(permission));
      }
    }
  }
}
