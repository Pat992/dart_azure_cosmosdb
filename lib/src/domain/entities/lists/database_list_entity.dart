import 'package:dart_azure_cosmosdb/src/domain/entities/lists/base_list_entity.dart';
import 'package:dart_azure_cosmosdb/src/domain/entities/single/database_entity.dart';

abstract class DatabaseListEntity extends BaseListEntity {
  List<DatabaseEntity> databases;

  DatabaseListEntity({
    super.error = const {},
    this.databases = const [],
  });
}
