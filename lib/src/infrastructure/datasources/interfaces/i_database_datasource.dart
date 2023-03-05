// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
abstract class IDatabaseDatasource {
  Future<Map<String, dynamic>> list();

  Future<Map<String, dynamic>> get({
    required String dbId,
  });

  Future<Map<String, dynamic>> create({
    required String dbId,
  });

  Future<Map<String, dynamic>> delete({
    required String dbId,
  });
}
