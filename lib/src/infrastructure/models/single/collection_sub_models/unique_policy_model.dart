// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
class UniqueKeyPolicy {
  List<dynamic> uniqueKeys;

  UniqueKeyPolicy({
    this.uniqueKeys = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'uniqueKeys': [
        {'paths': uniqueKeys}
      ],
    };
  }

  UniqueKeyPolicy.fromMap(Map<String, dynamic> map)
      : uniqueKeys = map['uniqueKeys'][0]['paths'] as List<dynamic>;
}
