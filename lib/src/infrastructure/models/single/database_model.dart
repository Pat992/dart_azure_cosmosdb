import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/base_model.dart';

class CosmosDatabase extends Base {
  String colls;
  String users;

  CosmosDatabase({
    required super.id,
    this.colls = '',
    this.users = '',
    super.rid = '',
    super.ts = 0,
    super.self = '',
    super.etag = '',
    super.error = const {},
  });

  @override
  Map<String, dynamic> toMap() {
    var body = super.toMap();

    body.addAll({
      'colls': colls,
      'users': users,
    });

    return body;
  }

  @override
  CosmosDatabase.fromMap(Map<String, dynamic> map)
      : colls = map['colls'] as String,
        users = map['users'] as String,
        super.fromMap(map);
}
