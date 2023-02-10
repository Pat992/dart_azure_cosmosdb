import 'package:dart_azure_cosmosdb/src/domain/entities/single/base_entity.dart';

abstract class DatabaseEntity extends BaseEntity {
  String colls;
  String users;

  DatabaseEntity({
    required super.id,
    super.error = const {},
    this.colls = '',
    this.users = '',
  });
}
