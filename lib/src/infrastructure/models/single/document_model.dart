// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/base_model.dart';

class CosmosDocument extends Base {
  Map<String, dynamic> values;
  String attachments;

  CosmosDocument({
    required super.id,
    this.values = const {},
    this.attachments = '',
    super.rid = '',
    super.ts = 0,
    super.self = '',
    super.etag = '',
    super.error = const {},
  });

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

  @override
  CosmosDocument.fromMap(Map<String, dynamic> map)
      : values = map,
        attachments = map['_attachments'] ?? '',
        super.fromMap(map) {
    values.remove('_attachments');
  }
}
