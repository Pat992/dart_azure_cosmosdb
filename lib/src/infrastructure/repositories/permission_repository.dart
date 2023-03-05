// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/core/enum/permission_enum.dart';
import 'package:dart_azure_cosmosdb/src/domain/repositories/i_permission_repository.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_permission_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/permission_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/permission_model.dart';

class PermissionRepository implements IPermissionRepository {
  final IPermissionDatasource permissionDatasource;

  PermissionRepository({required this.permissionDatasource});

  @override
  Future<Permission> create({
    required String dbId,
    required String userId,
    required String permissionId,
    required String collectionId,
    required PermissionMode permissionMode,
  }) async {
    try {
      final res = await permissionDatasource.create(
        dbId: dbId,
        userId: userId,
        permissionId: permissionId,
        collectionId: collectionId,
        permissionMode: permissionMode,
      );

      return Permission.fromMap(res);
    } catch (e) {
      return Permission.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }

  @override
  Future<Permission> delete({
    required String dbId,
    required String userId,
    required String permissionId,
  }) async {
    try {
      final res = await permissionDatasource.delete(
        dbId: dbId,
        userId: userId,
        permissionId: permissionId,
      );

      if (res.isEmpty) {
        return Permission(
          id: permissionId,
          permissionMode: PermissionMode.all,
          resource: '',
        );
      }

      return Permission.fromMap(res);
    } catch (e) {
      return Permission.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }

  @override
  Future<Permission> get({
    required String dbId,
    required String userId,
    required String permissionId,
  }) async {
    try {
      final res = await permissionDatasource.get(
        dbId: dbId,
        userId: userId,
        permissionId: permissionId,
      );

      return Permission.fromMap(res);
    } catch (e) {
      return Permission.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }

  @override
  Future<PermissionList> list({
    required String dbId,
    required String userId,
  }) async {
    try {
      final res = await permissionDatasource.list(
        dbId: dbId,
        userId: userId,
      );

      return PermissionList.fromMap(res);
    } catch (e) {
      return PermissionList.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }

  @override
  Future<Permission> replace({
    required String dbId,
    required String userId,
    required String newPermissionId,
    required String permissionId,
    required String collectionId,
    required PermissionMode permissionMode,
  }) async {
    try {
      final res = await permissionDatasource.replace(
        dbId: dbId,
        userId: userId,
        newPermissionId: newPermissionId,
        permissionId: permissionId,
        collectionId: collectionId,
        permissionMode: permissionMode,
      );

      return Permission.fromMap(res);
    } catch (e) {
      return Permission.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }
}
