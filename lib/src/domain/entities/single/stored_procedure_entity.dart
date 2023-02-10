import 'package:dart_azure_cosmosdb/src/domain/entities/single/base_entity.dart';

abstract class StoredProcedureEntity extends BaseEntity {
  String body;

  StoredProcedureEntity({
    required super.id,
    required super.rid,
    required super.ts,
    required super.self,
    required super.etag,
    required super.error,
    required this.body,
  });
}
