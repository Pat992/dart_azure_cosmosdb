import 'package:dart_azure_cosmosdb/src/domain/repositories/i_database_repository.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_database_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/database_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/database_model.dart';

class DatabaseRepository implements IDatabaseRepository {
  final IDatabaseDatasource databaseDatasource;

  DatabaseRepository({required this.databaseDatasource});

  @override
  Future<CosmosDatabase> create({required String dbId}) async {
    try {
      final res = await databaseDatasource.create(dbId: dbId);

      return CosmosDatabase.fromMap(res);
    } catch (e) {
      return CosmosDatabase.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }

  @override
  Future<CosmosDatabase> delete({required String dbId}) async {
    try {
      final res = await databaseDatasource.delete(dbId: dbId);

      if (res.isEmpty) {
        return CosmosDatabase(id: dbId);
      }

      return CosmosDatabase.fromMap(res);
    } catch (e) {
      return CosmosDatabase.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }

  @override
  Future<CosmosDatabase> get({required String dbId}) async {
    try {
      final res = await databaseDatasource.get(dbId: dbId);

      return CosmosDatabase.fromMap(res);
    } catch (e) {
      return CosmosDatabase.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }

  @override
  Future<CosmosDatabaseList> list() async {
    try {
      final res = await databaseDatasource.list();

      return CosmosDatabaseList.fromMap(res);
    } catch (e) {
      return CosmosDatabaseList.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }
}
