// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
enum PermissionMode {
  all('All'),
  read('Read');

  final String value;

  const PermissionMode(this.value);
}
