import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/base_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/stored_procedure_model.dart';

class StoredProcedureList extends BaseList {
  List<StoredProcedure> storedProcedures;

  StoredProcedureList({
    this.storedProcedures = const [],
    super.error = const {},
    super.rid = '',
    super.count = 0,
  });

  @override
  Map<String, dynamic> toMap() {
    var body = super.toMap();

    body.addAll({
      'StoredProcedures': storedProcedures,
    });

    return body;
  }

  @override
  StoredProcedureList.fromMap(Map<String, dynamic> map)
      : storedProcedures = map['StoredProcedures'] as List<StoredProcedure>,
        super.fromMap(map);
}
