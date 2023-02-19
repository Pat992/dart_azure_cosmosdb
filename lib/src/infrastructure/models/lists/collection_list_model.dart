import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/base_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_model.dart';

class CollectionList extends BaseList {
  List<Collection> collections = [];

  CollectionList({
    this.collections = const [],
    super.error = const {},
    super.rid = '',
    super.count = 0,
  });

  @override
  Map<String, dynamic> toMap() {
    var body = super.toMap();

    if (error.isEmpty) {
      body.addAll({
        'DocumentCollections': collections
            .map(
              (collection) => collection.toMap(),
            )
            .toList(),
      });
    }

    return body;
  }

  @override
  CollectionList.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    if (map.containsKey('DocumentCollections')) {
      for (final collection in map['DocumentCollections']) {
        collections.add(Collection.fromMap(collection));
      }
    }
  }
}
