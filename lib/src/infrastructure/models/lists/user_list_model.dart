import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/base_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/user_model.dart';

class UserList extends BaseList {
  List<User> users;

  UserList({
    this.users = const [],
    super.error = const {},
    super.rid = '',
    super.count = 0,
  });

  @override
  Map<String, dynamic> toMap() {
    var body = super.toMap();

    body.addAll({
      'Users': users,
    });

    return body;
  }

  @override
  UserList.fromMap(Map<String, dynamic> map)
      : users = map['Users'] as List<User>,
        super.fromMap(map);
}
