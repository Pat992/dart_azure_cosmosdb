import 'package:dart_azure_cosmosdb/src/domain/entities/lists/base_list_entity.dart';
import 'package:dart_azure_cosmosdb/src/domain/entities/single/user_entity.dart';

abstract class UserListEntity extends BaseListEntity {
  List<UserEntity> users;

  UserListEntity({
    super.error = const {},
    this.users = const [],
  });
}
