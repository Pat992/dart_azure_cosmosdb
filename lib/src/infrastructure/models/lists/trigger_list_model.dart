import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/base_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/trigger_model.dart';

class TriggerList extends BaseList {
  List<Trigger> triggers;

  TriggerList({
    this.triggers = const [],
    super.error = const {},
    super.rid = '',
    super.count = 0,
  });

  @override
  Map<String, dynamic> toMap() {
    var body = super.toMap();

    body.addAll({
      'Triggers': triggers,
    });

    return body;
  }

  @override
  TriggerList.fromMap(Map<String, dynamic> map)
      : triggers = map['Triggers'] as List<Trigger>,
        super.fromMap(map);
}
