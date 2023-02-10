import 'package:dart_azure_cosmosdb/src/domain/entities/single/base_entity.dart';

abstract class PermissionEntity extends BaseEntity {
  String permissionMode;
  String resource;
  String token;

  PermissionEntity({
    required super.id,
    super.error = const {},
    required this.permissionMode,
    required this.resource,
    this.token = '',
  });
}
