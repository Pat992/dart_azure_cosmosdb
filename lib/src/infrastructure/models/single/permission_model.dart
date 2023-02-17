import 'package:dart_azure_cosmosdb/src/core/enum/permission_enum.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/base_model.dart';

class Permission extends Base {
  PermissionMode permissionMode;
  String resource;
  String token;

  Permission({
    required super.id,
    required this.permissionMode,
    required this.resource,
    this.token = '',
    super.rid = '',
    super.ts = 0,
    super.self = '',
    super.etag = '',
    super.error = const {},
  });

  @override
  Map<String, dynamic> toMap() {
    var body = super.toMap();

    body.addAll({
      'permissionMode': permissionMode.value,
      'resource': resource,
      'token': token,
    });

    return body;
  }

  @override
  Permission.fromMap(Map<String, dynamic> map)
      : permissionMode = map['permissionMode'] == 'All'
            ? PermissionMode.all
            : PermissionMode.read,
        resource = map['resource'] ?? '',
        token = map['_token'] ?? '',
        super.fromMap(map);
}
