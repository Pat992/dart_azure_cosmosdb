import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/base_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/document_model.dart';

class CosmosDocumentList extends BaseList {
  List<CosmosDocument> documents;

  CosmosDocumentList({
    this.documents = const [],
    super.error = const {},
    super.rid = '',
    super.count = 0,
  });

  @override
  Map<String, dynamic> toMap() {
    var body = super.toMap();

    body.addAll({
      'Documents': documents,
    });

    return body;
  }

  @override
  CosmosDocumentList.fromMap(Map<String, dynamic> map)
      : documents = map['Documents'] as List<CosmosDocument>,
        super.fromMap(map);
}
