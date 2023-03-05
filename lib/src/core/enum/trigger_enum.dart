// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
enum TriggerOperation {
  all('All'),
  create('Create'),
  replace('Replace'),
  delete('Delete');

  final String value;

  const TriggerOperation(this.value);
}

enum TriggerType {
  pre('Pre'),
  post('Post');

  final String value;

  const TriggerType(this.value);
}
