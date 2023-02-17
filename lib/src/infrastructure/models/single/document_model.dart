import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/base_model.dart';

class CosmosDocument extends Base {
  Map<String, dynamic> values;

  CosmosDocument({
    required super.id,
    this.values = const {},
    super.rid = '',
    super.ts = 0,
    super.self = '',
    super.etag = '',
    super.error = const {},
  });

  @override
  Map<String, dynamic> toMap() {
    var body = values;
    var baseBody = super.toMap();

    body.addAll(baseBody);

    return body;
  }

  @override
  CosmosDocument.fromMap(Map<String, dynamic> map)
      : values = map,
        super.fromMap(map);
}
