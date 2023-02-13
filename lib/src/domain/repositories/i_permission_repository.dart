import 'package:dart_azure_cosmosdb/src/core/enum/permission_enum.dart';

abstract class IPermissionRepository {
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
    required String collId,
    required PermissionMode permissionMode,
  });

  Future<Map<String, dynamic>> replace({
    required String dbId,
    required String userId,
    required String oldPermissionId,
    required String permissionId,
    required String collId,
    required PermissionMode permissionMode,
  });

  Future<Map<String, dynamic>> delete({
    required String dbId,
    required String userId,
    required String permissionId,
  });
}
