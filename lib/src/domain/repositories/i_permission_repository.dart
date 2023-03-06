// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/core/enum/permission_enum.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/models_barrel.dart';

/// A permission is an authorization token associated with a user for authorized access to a specific resource.
/// It is used to manage access to collections, documents, attachments, stored procedures, triggers, and user-defined functions for a particular user.
abstract class IPermissionRepository {
  /// **Description:** GET operation on the permissions URI path, which returns a list of permissions for the user.
  /// All of the resource tokens are recreated for the respective permissions returned as part of the response.
  /// The new tokens have the default validity period (one hour) unless it is overridden.
  ///
  /// **dbId:** User generated name/id of the database.
  ///
  /// [Type:] String *required*
  ///
  /// **userId:** Name/id of the user, the permissions are assigned to.
  ///
  /// [Type:] String *required*
  Future<PermissionList> list({
    required String dbId,
    required String userId,
  });

  /// **Description:** Performing a GET operation on a specific permission resource retrieves the permission properties, including the token, for the particular permission.
  /// A new resource token is created every time a GET is invoked on the permission resource.
  /// This new token has the default validity period of one hour, unless it is overridden.
  ///
  /// **dbId:** User generated name/id of the database.
  ///
  /// [Type:] String *required*
  ///
  /// **userId:** Name/id of the user, the permission is assigned to.
  ///
  /// [Type:] String *required*
  ///
  /// **permissionId:** Name/id of the permission to be retrieved.
  ///
  /// [Type:] String *required*
  Future<Permission> get({
    required String dbId,
    required String userId,
    required String permissionId,
  });

  /// **Description:** The create-operation creates a new permission in a database.
  ///
  /// **dbId:** User generated name/id of the database.
  ///
  /// [Type:] String *required*
  ///
  /// **userId:** Name/id of the user, the permission will be assigned to.
  ///
  /// [Type:] String *required*
  ///
  /// **permissionId:** Name/id of the permission to be created.
  ///
  /// [Type:] String *required*
  ///
  /// **collectionId:** The full addressable path of the resource associated with the permission. For example, dbs/volcanodb/colls/volcano1.
  ///
  /// [Type:] String *required*
  ///
  /// **permissionMode:** The access mode for the resource: All or Read. All provides read, write, and delete access to a resource.
  /// Read restricts the user to read access on the resource.
  ///
  /// [Type:] PermissionMode *required*
  Future<Permission> create({
    required String dbId,
    required String userId,
    required String permissionId,
    required String collectionId,
    required PermissionMode permissionMode,
  });

  /// **Description:** Performing a PUT operation on a specific permission resource replaces the entire user resource.
  /// All user settable properties, the id, permissionMode, and resource, must be submitted in the body to perform the replacement.
  ///
  /// **dbId:** User generated name/id of the database.
  ///
  /// [Type:] String *required*
  ///
  /// **userId:** Name/id of the user, the permission is assigned to.
  ///
  /// [Type:] String *required*
  ///
  /// **newPermissionId:** The new name/id of the permission.
  ///
  /// [Type:] String *required*
  ///
  /// **permissionId:** Name/id of the permission to be replaced.
  ///
  /// [Type:] String *required*
  ///
  /// **collectionId:** The full addressable path of the resource associated with the permission. For example, dbs/volcanodb/colls/volcano1.
  ///
  /// [Type:] String *required*
  ///
  /// **permissionMode:** The access mode for the resource: All or Read. All provides read, write, and delete access to a resource.
  /// Read restricts the user to read access on the resource.
  ///
  /// [Type:] PermissionMode *required*
  Future<Permission> replace({
    required String dbId,
    required String userId,
    required String newPermissionId,
    required String permissionId,
    required String collectionId,
    required PermissionMode permissionMode,
  });

  /// **Description:** The delete-operation deletes an existing permission in a database.
  ///
  /// **dbId:** User generated name/id of the database.
  ///
  /// [Type:] String *required*
  ///
  /// **userId:** Name/id of the user, the permission is assigned to.
  ///
  /// [Type:] String *required*
  ///
  /// **permissionId:** Name/id of the permission to be deleted.
  ///
  /// [Type:] String *required*
  Future<Permission> delete({
    required String dbId,
    required String userId,
    required String permissionId,
  });
}
