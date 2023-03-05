// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/core/enum/permission_enum.dart';

abstract class IPermissionDatasource {
  Future<Map<String, dynamic>> list({
    required String dbId,
    required String userId,
  });

  Future<Map<String, dynamic>> get({
    required String dbId,
    required String userId,
    required String permissionId,
  });

  Future<Map<String, dynamic>> create({
    required String dbId,
    required String userId,
    required String permissionId,
    required String collectionId,
    required PermissionMode permissionMode,
  });

  Future<Map<String, dynamic>> replace({
    required String dbId,
    required String userId,
    required String newPermissionId,
    required String permissionId,
    required String collectionId,
    required PermissionMode permissionMode,
  });

  Future<Map<String, dynamic>> delete({
    required String dbId,
    required String userId,
    required String permissionId,
  });
}
