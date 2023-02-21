import 'package:dart_azure_cosmosdb/src/infrastructure/models/models_barrel.dart';

abstract class IDatabaseRepository {
  Future<CosmosDatabaseList> list();

  Future<CosmosDatabase> get({
    required String dbId,
  });

  Future<CosmosDatabase> create({
    required String dbId,
  });

  Future<CosmosDatabase> delete({
    required String dbId,
  });
}
