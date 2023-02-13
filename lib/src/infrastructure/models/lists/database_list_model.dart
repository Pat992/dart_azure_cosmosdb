import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/base_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/database_model.dart';

class CosmosDatabaseList extends BaseList {
  List<CosmosDatabase> databases;

  CosmosDatabaseList({
    this.databases = const [],
    super.error = const {},
    super.rid = '',
    super.count = 0,
  });

  @override
  Map<String, dynamic> toMap() {
    var body = super.toMap();

    body.addAll({
      'Databases': databases,
    });

    return body;
  }

  @override
  CosmosDatabaseList.fromMap(Map<String, dynamic> map)
      : databases = map['Databases'] as List<CosmosDatabase>,
        super.fromMap(map);
}
