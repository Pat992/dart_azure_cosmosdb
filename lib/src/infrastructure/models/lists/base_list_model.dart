// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
class BaseList {
  String rid;
  int count;
  Map<String, String> error;

  BaseList({
    required this.error,
    required this.rid,
    required this.count,
  });

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

  BaseList.fromMap(Map<String, dynamic> map)
      : rid = map['_rid'] ?? '',
        count = map['_count'] ?? 0,
        error = map.containsKey('code') && map.containsKey('message')
            ? {'code': map['code'], 'message': map['message']}
            : {};
}
