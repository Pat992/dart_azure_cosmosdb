// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/base_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/permission_model.dart';

class PermissionList extends BaseList {
  List<Permission> permissions = [];

  PermissionList({
    this.permissions = const [],
    super.error = const {},
    super.rid = '',
    super.count = 0,
  });

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

  @override
  PermissionList.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    if (map.containsKey('Permissions')) {
      for (final permission in map['Permissions']) {
        permissions.add(Permission.fromMap(permission));
      }
    }
  }
}
