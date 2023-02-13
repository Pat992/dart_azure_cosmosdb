import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/base_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/permission_model.dart';

class PermissionList extends BaseList {
  List<Permission> permissions;

  PermissionList({
    this.permissions = const [],
    super.error = const {},
    super.rid = '',
    super.count = 0,
  });

  @override
  Map<String, dynamic> toMap() {
    var body = super.toMap();

    body.addAll({
      'Permissions': permissions,
    });

    return body;
  }

  @override
  PermissionList.fromMap(Map<String, dynamic> map)
      : permissions = map['Permissions'] as List<Permission>,
        super.fromMap(map);
}
