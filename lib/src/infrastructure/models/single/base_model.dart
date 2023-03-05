// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

/// **Description:** Model of the [Base], used by other models
class Base {
  /// **Description:** The unique user generated name for the resource.
  /// The id field must not exceed 255 characters.
  ///
  /// **Example:** 'myId1'
  String id;

  /// **Description:** It is a system generated property. The resource ID (_rid) is a unique identifier that is also hierarchical per the resource stack on the resource model.
  /// It is used internally for placement of and navigation to the resource.
  ///
  /// **Example:** 'qicAAA=='
  String rid;

  /// **Description:** It is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.
  ///
  /// **Example:** 1446192371
  int ts;

  /// **Description:** It is a system generated property. It is the unique addressable URI for the resource.
  ///
  /// **Example:** 'dbs\/qicAAA==\/'
  String self;

  /// **Description:** It is a system generated property representing the resource etag required for optimistic concurrency control.
  ///
  /// **Example:** '"00001800-0000-0000-0000-563324f30000"'
  String etag;

  /// **Description:** An empty Map if success, else a map with a code and a message
  ///
  /// **Example:** { code: 'Error_Code', message: 'Error message' }
  Map<String, String> error;

  /// **Description:** Creates a [Base] model Object
  Base({
    required this.id,
    required this.error,
    required this.rid,
    required this.ts,
    required this.self,
    required this.etag,
  });

  /// **Description:** Transforms a Map from the CosmosDB API to the [Base] model.
  Base.fromMap(Map<String, dynamic> map)
      : id = map['id'] ?? '',
        rid = map['_rid'] ?? '',
        ts = map['_ts'] ?? 0,
        self = map['_self'] ?? '',
        etag = map['_etag'] ?? '',
        error = map.containsKey('code') && map.containsKey('message')
            ? {'code': map['code'], 'message': map['message']}
            : {};

  /// **Description:** Transforms the [Base] model to a Map for the CosmosDB API.
  Map<String, dynamic> toMap() {
    if (error.isNotEmpty) {
      return {
        'code': error['code'],
        'message': error['message'],
      };
    }
    return {
      'id': id,
      '_rid': rid,
      '_ts': ts,
      '_self': self,
      '_etag': etag,
    };
  }
}
