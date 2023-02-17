import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/base_model.dart';

class StoredProcedure extends Base {
  String body;

  StoredProcedure({
    required super.id,
    required this.body,
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
      'body': body,
    });

    return body;
  }

  @override
  StoredProcedure.fromMap(Map<String, dynamic> map)
      : body = map['body'] ?? '',
        super.fromMap(map);
}
