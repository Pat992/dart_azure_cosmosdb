// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/base_model.dart';

class CosmosDatabase extends Base {
  String colls;
  String users;

  CosmosDatabase({
    required super.id,
    this.colls = '',
    this.users = '',
    super.rid = '',
    super.ts = 0,
    super.self = '',
    super.etag = '',
    super.error = const {},
  });

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

  @override
  CosmosDatabase.fromMap(Map<String, dynamic> map)
      : colls = map['_colls'] ?? '',
        users = map['_users'] ?? '',
        super.fromMap(map);
}
