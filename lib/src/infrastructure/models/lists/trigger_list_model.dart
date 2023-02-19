import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/base_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/trigger_model.dart';

class TriggerList extends BaseList {
  List<Trigger> triggers = [];

  TriggerList({
    this.triggers = const [],
    super.error = const {},
    super.rid = '',
    super.count = 0,
  });

  @override
  Map<String, dynamic> toMap() {
    var body = super.toMap();

    if (error.isEmpty) {
      body.addAll({
        'Triggers': triggers
            .map(
              (trigger) => trigger.toMap(),
            )
            .toList(),
      });
    }

    return body;
  }

  @override
  TriggerList.fromMap(Map<String, dynamic> map)
      : triggers = map['Triggers'] as List<Trigger>,
        super.fromMap(map) {
    if (map.containsKey('Triggers')) {
      for (final trigger in map['Triggers']) {
        triggers.add(Trigger.fromMap(trigger));
      }
    }
  }
}
