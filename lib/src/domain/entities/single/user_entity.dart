import 'package:dart_azure_cosmosdb/src/domain/entities/single/base_entity.dart';

abstract class UserEntity extends BaseEntity {
  String permissions;

  UserEntity({
    required super.id,
    super.error = const {},
    this.permissions = '',
  });
}
