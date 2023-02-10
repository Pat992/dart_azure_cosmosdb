import 'package:dart_azure_cosmosdb/src/domain/entities/lists/base_list_entity.dart';
import 'package:dart_azure_cosmosdb/src/domain/entities/single/document_entity.dart';

abstract class DocumentListEntity extends BaseListEntity {
  List<DocumentEntity> documents;

  DocumentListEntity({
    super.error = const {},
    this.documents = const [],
  });
}
