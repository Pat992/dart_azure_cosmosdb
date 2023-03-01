// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
enum ResourceType {
  collections('colls'),
  dbs('dbs'),
  docs('docs'),
  permissions('permissions'),
  users('users'),
  attachments('attachments'),
  storedProcedures('sprocs'),
  userDefinedFunctions('udfs'),
  triggers('triggers'),
  offers('offers');

  final String value;

  const ResourceType(this.value);
}
