import 'package:dart_azure_cosmosdb/src/domain/entities/single/base_entity.dart';

abstract class StoredProcedureEntity extends BaseEntity {
  String body;

  StoredProcedureEntity({
    required super.id,
    super.error = const {},
    required this.body,
  });
}
