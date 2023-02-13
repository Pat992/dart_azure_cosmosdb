import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/base_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_model.dart';

class CollectionList extends BaseList {
  List<Collection> documentCollections;

  CollectionList({
    this.documentCollections = const [],
    super.error = const {},
    super.rid = '',
    super.count = 0,
  });

  @override
  Map<String, dynamic> toMap() {
    var body = super.toMap();

    body.addAll({
      'DocumentCollections': documentCollections,
    });

    return body;
  }

  @override
  CollectionList.fromMap(Map<String, dynamic> map)
      : documentCollections = map['DocumentCollections'] as List<Collection>,
        super.fromMap(map);
}
