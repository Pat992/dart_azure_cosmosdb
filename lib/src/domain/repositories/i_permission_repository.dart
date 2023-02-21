import 'package:dart_azure_cosmosdb/src/core/enum/permission_enum.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/models_barrel.dart';

abstract class IPermissionRepository {
  Future<PermissionList> list({
    required String dbId,
    required String userId,
  });

  Future<Permission> get({
    required String dbId,
    required String userId,
    required String permissionId,
  });

  Future<Permission> create({
    required String dbId,
    required String userId,
    required String permissionId,
    required String collectionId,
    required PermissionMode permissionMode,
  });

  Future<Permission> replace({
    required String dbId,
    required String userId,
    required String newPermissionId,
    required String permissionId,
    required String collectionId,
    required PermissionMode permissionMode,
  });

  Future<Permission> delete({
    required String dbId,
    required String userId,
    required String permissionId,
  });
}
