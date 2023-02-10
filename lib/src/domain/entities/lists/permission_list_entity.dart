import 'package:dart_azure_cosmosdb/src/domain/entities/lists/base_list_entity.dart';
import 'package:dart_azure_cosmosdb/src/domain/entities/single/permission_entity.dart';

abstract class PermissionList extends BaseListEntity {
  List<PermissionEntity> permissions;

  PermissionList({
    super.error = const {},
    this.permissions = const [],
  });
}
