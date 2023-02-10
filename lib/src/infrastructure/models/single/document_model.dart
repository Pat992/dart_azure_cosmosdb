import 'package:dart_azure_cosmosdb/src/domain/entities/single/document_entity.dart';

class Document extends DocumentEntity {
  Document({
    super.attachments = '',
    super.values = const {},
    required super.id,
    super.rid = '',
    super.ts = 0,
    super.self = '',
    super.etag = '',
    super.error = const {},
  });

  Map<String, dynamic> toMap() {
    return {
      'attachments': attachments,
      'values': values,
      'id': id,
      '_rid': rid,
      '_ts': ts,
      '_self': self,
      '_etag': etag,
    };
  }

  factory Document.fromMap(Map<String, dynamic> map) {
    return Document(
      attachments: map['attachments'] as String,
      values: map['values'] as Map<String, dynamic>,
      id: map['id'] as String,
      rid: map['_rid'] as String,
      ts: map['_ts'] as int,
      self: map['_self'] as String,
      etag: map['_etag'] as String,
      error: map['error'] as Object,
    );
  }
}
