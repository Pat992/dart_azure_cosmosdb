import 'package:dart_azure_cosmosdb/src/domain/entities/lists/base_list_entity.dart';
import 'package:dart_azure_cosmosdb/src/domain/entities/single/stored_procedure_entity.dart';

abstract class StoredProcedureListEntity extends BaseListEntity {
  List<StoredProcedureEntity> storedProcedures = [];

  StoredProcedureListEntity({
    super.error = const {},
    this.storedProcedures = const [],
  });
}
