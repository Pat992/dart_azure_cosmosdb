// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

/// **Description:** Model of the [BaseList], used by other models
class BaseList {
  /// **Description:** It is a system generated property. The resource ID (_rid) is a unique identifier that is also hierarchical per the resource stack on the resource model.
  /// It is used internally for placement of and navigation to the resource.
  ///
  /// **Example:** 'qicAAA=='
  String rid;

  /// **Description:** This property shows the number of resources returned as part of list operation.
  ///
  /// **Example:** 3
  int count;

  /// **Description:** An empty Map if success, else a map with a code and a message
  ///
  /// **Example:** { code: 'Error_Code', message: 'Error message' }
  Map<String, String> error;

  /// **Description:** Creates a [BaseList] model Object
  BaseList({
    required this.error,
    required this.rid,
    required this.count,
  });

  /// **Description:** Transforms a Map from the CosmosDB API to the [BaseList] model.
  Map<String, dynamic> toMap() {
    if (error.isNotEmpty) {
      return {
        'code': error['code'],
        'message': error['message'],
      };
    }
    return {
      '_rid': rid,
      '_count': count,
    };
  }

  /// **Description:** Transforms the [BaseList] model to a Map for the CosmosDB API.
  BaseList.fromMap(Map<String, dynamic> map)
      : rid = map['_rid'] ?? '',
        count = map['_count'] ?? 0,
        error = map.containsKey('code') && map.containsKey('message')
            ? {'code': map['code'], 'message': map['message']}
            : {};
}
