import 'package:dart_azure_cosmosdb/src/domain/repositories/i_collection_repository.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_collection_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/collection_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_sub_models/partition_key_model.dart';

class CollectionRepository implements ICollectionRepository {
  final ICollectionDatasource collectionDatasource;

  CollectionRepository({required this.collectionDatasource});

  @override
  Future<Collection> create({
    required String dbId,
    required String collectionId,
    required String partitionKey,
    required int version,
  }) async {
    try {
      final res = await collectionDatasource.create(
        dbId: dbId,
        collectionId: collectionId,
        partitionKey: partitionKey,
        version: version,
      );

      return Collection.fromMap(res);
    } catch (e) {
      return Collection.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }

  @override
  Future<Collection> delete({
    required String dbId,
    required String collectionId,
  }) async {
    try {
      final res = await collectionDatasource.delete(
        dbId: dbId,
        collectionId: collectionId,
      );

      if (res.isEmpty) {
        return Collection(
          partitionKey: PartitionKey(
            paths: [],
          ),
          id: collectionId,
        );
      }

      return Collection.fromMap(res);
    } catch (e) {
      return Collection.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }

  @override
  Future<Collection> get({
    required String dbId,
    required String collectionId,
  }) async {
    try {
      final res = await collectionDatasource.get(
        dbId: dbId,
        collectionId: collectionId,
      );

      return Collection.fromMap(res);
    } catch (e) {
      return Collection.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }

  @override
  Future<CollectionList> list({
    required String dbId,
  }) async {
    try {
      final res = await collectionDatasource.list(
        dbId: dbId,
      );

      return CollectionList.fromMap(res);
    } catch (e) {
      return CollectionList.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }
}
