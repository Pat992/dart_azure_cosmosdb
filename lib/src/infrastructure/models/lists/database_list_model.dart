import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/base_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/database_model.dart';

class CosmosDatabaseList extends BaseList {
  List<CosmosDatabase> databases = [];

  CosmosDatabaseList({
    this.databases = const [],
    super.error = const {},
    super.rid = '',
    super.count = 0,
  });

  @override
  Map<String, dynamic> toMap() {
    var body = super.toMap();

    if (error.isEmpty) {
      body.addAll({
        'Databases': databases
            .map(
              (db) => db.toMap(),
            )
            .toList(),
      });
    }

    return body;
  }

  @override
  CosmosDatabaseList.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    if (map.containsKey('Databases')) {
      for (final db in map['Databases']) {
        databases.add(CosmosDatabase.fromMap(db));
      }
    }
  }
}
