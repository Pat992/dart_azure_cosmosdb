import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/base_model.dart';

class CosmosDocument extends Base {
  Map<String, dynamic> values;
  String attachements;

  CosmosDocument({
    required super.id,
    this.values = const {},
    this.attachements = '',
    super.rid = '',
    super.ts = 0,
    super.self = '',
    super.etag = '',
    super.error = const {},
  });

  @override
  Map<String, dynamic> toMap() {
    if (error.isEmpty) {
      final body = values;
      if (attachements.isNotEmpty) {
        body.remove('_attachments');
        body.addAll({
          '_attachments': attachements,
        });
      }

      final baseBody = super.toMap();

      body.addAll(baseBody);
      return body;
    }
    final body = super.toMap();
    return body;
  }

  @override
  CosmosDocument.fromMap(Map<String, dynamic> map)
      : values = map,
        attachements = map['_attachments'] ?? '',
        super.fromMap(map) {
    values.remove('_attachments');
  }
}
