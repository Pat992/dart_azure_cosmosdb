import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/base_model.dart';

class Permission extends Base {
  String permissionMode;
  String resource;
  String token;

  Permission({
    this.token = '',
    this.permissionMode = '',
    this.resource = '',
    required super.id,
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
      'permissionMode': permissionMode,
      'resource': resource,
      'token': token,
    });

    return body;
  }

  @override
  Permission.fromMap(Map<String, dynamic> map)
      : permissionMode = map['permissionMode'] ?? '',
        resource = map['resource'] ?? '',
        token = map['_token'] ?? '',
        super.fromMap(map);
}
