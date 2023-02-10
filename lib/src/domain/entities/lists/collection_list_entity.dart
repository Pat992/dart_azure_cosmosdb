import 'package:dart_azure_cosmosdb/src/domain/entities/lists/base_list_entity.dart';
import 'package:dart_azure_cosmosdb/src/domain/entities/single/collection_entity.dart';

abstract class CollectionListEntity extends BaseListEntity {
  List<CollectionEntity> documentCollections;

  CollectionListEntity({
    super.error = const {},
    this.documentCollections = const [],
  });
}
