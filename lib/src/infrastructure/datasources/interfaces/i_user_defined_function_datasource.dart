// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
abstract class IUserDefinedFunctionDatasource {
  Future<Map<String, dynamic>> list({
    required String dbId,
    required String collectionId,
  });

  Future<Map<String, dynamic>> create({
    required String dbId,
    required String collectionId,
    required String userDefinedFunctionId,
    required String function,
  });

  Future<Map<String, dynamic>> replace({
    required String dbId,
    required String collectionId,
    required String userDefinedFunctionId,
    required String function,
  });

  Future<Map<String, dynamic>> delete({
    required String dbId,
    required String collectionId,
    required String userDefinedFunctionId,
  });
}
