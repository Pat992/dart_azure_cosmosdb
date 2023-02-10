import 'package:dart_azure_cosmosdb/src/domain/entities/single/base_entity.dart';

abstract class DocumentEntity extends BaseEntity {
  String attachments;
  Map<String, dynamic> values;

  DocumentEntity({
    required super.id,
    required super.rid,
    required super.ts,
    required super.self,
    required super.etag,
    required super.error,
    required this.attachments,
    required this.values,
  });
}
