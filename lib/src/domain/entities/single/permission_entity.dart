import 'package:dart_azure_cosmosdb/src/domain/entities/single/base_entity.dart';

abstract class PermissionEntity extends BaseEntity {
  String permissionMode;
  String resource;
  String token;

  PermissionEntity({
    required this.permissionMode,
    required this.resource,
    required this.token,
    required super.id,
    required super.rid,
    required super.ts,
    required super.self,
    required super.etag,
    required super.error,
  });
}
