import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/base_model.dart';

class User extends Base {
  String permissions = '';

  User({
    required super.id,
    this.permissions = '',
    super.rid = '',
    super.ts = 0,
    super.self = '',
    super.etag = '',
    super.error = const {},
  });

  @override
  Map<String, dynamic> toMap() {
    final body = super.toMap();

    if (error.isEmpty) {
      body.addAll({
        '_permissions': permissions,
      });
    }

    return body;
  }

  @override
  User.fromMap(Map<String, dynamic> map)
      : permissions = map['_permissions'] ?? '',
        super.fromMap(map);
}
