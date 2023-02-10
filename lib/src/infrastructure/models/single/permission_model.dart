import 'package:dart_azure_cosmosdb/src/domain/entities/single/permission_entity.dart';

class Permission extends PermissionEntity {
  Permission({
    super.token = '',
    super.permissionMode = '',
    super.resource = '',
    required super.id,
    super.rid = '',
    super.ts = 0,
    super.self = '',
    super.etag = '',
    super.error = const {},
  });

  Map<String, dynamic> toMap() {
    return {
      'permissionMode': permissionMode,
      'resource': resource,
      'token': token,
      'id': id,
      '_rid': rid,
      '_ts': ts,
      '_self': self,
      '_etag': etag,
    };
  }

  factory Permission.fromMap(Map<String, dynamic> map) {
    return Permission(
      permissionMode: map['permissionMode'] as String,
      resource: map['resource'] as String,
      token: map['token'] as String,
      id: map['id'] as String,
      rid: map['_rid'] as String,
      ts: map['_ts'] as int,
      self: map['_self'] as String,
      etag: map['_etag'] as String,
      error: map['error'] as Object,
    );
  }
}
