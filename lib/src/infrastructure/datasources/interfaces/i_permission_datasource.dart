// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/core/enum/permission_enum.dart';

/// Datasource to send requests to the Azure CosmosDB SQL api,
/// responsible for permissions.
abstract class IPermissionDatasource {
  /// **Description:** Lists all the existing permissions for a database and user.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the permissions are located.
  ///
  /// String userId - User for which the permissions are set.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> list({
    required String dbId,
    required String userId,
  });

  /// **Description:** Get an existing permission by its id.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the permission is located.
  ///
  /// String userId - User for which the permission is set.
  ///
  /// String permissionId - Id of the permission to get.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> get({
    required String dbId,
    required String userId,
    required String permissionId,
  });

  /// **Description:** Create a new permission in a collection for an existing user.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the collection is located.
  ///
  /// String userId - User for which the permission will be set.
  ///
  /// String permissionId - Id of the permission.
  ///
  /// String collectionId - Collection in which the permission will be located.
  ///
  /// PermissionMode permissionMode - Mode of the new permission.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> create({
    required String dbId,
    required String userId,
    required String permissionId,
    required String collectionId,
    required PermissionMode permissionMode,
  });

  /// **Description:** Update an existing permission in a collection.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the collection is located.
  ///
  /// String userId - User for which the permission will be updated.
  ///
  /// String newPermissionId - New id of the permission.
  ///
  /// String permissionId - Current id of the permission.
  ///
  /// String collectionId - Collection in which the permission is located.
  ///
  /// PermissionMode permissionMode - Mode of the permission.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> replace({
    required String dbId,
    required String userId,
    required String newPermissionId,
    required String permissionId,
    required String collectionId,
    required PermissionMode permissionMode,
  });

  /// **Description:** Delete an existing permission in a database.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the permission is located.
  ///
  /// String userId - User for which the permission is set.
  ///
  /// String permissionId - Id of the permission.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> delete({
    required String dbId,
    required String userId,
    required String permissionId,
  });
}
