import 'package:dart_azure_cosmosdb/src/domain/entities/single/base_entity.dart';

abstract class DocumentEntity extends BaseEntity {
  String attachments;
  Map<String, dynamic>? values;

  DocumentEntity({
    required super.id,
    super.error = const {},
    this.attachments = '',
    this.values,
  });
}
