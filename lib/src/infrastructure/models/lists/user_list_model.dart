import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/base_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/user_model.dart';

class UserList extends BaseList {
  List<User> users = [];

  UserList({
    this.users = const [],
    super.error = const {},
    super.rid = '',
    super.count = 0,
  });

  @override
  Map<String, dynamic> toMap() {
    var body = super.toMap();

    if (error.isEmpty) {
      body.addAll({
        'Users': users
            .map(
              (user) => user.toMap(),
            )
            .toList(),
      });
    }

    return body;
  }

  @override
  UserList.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    if (map.containsKey('Users')) {
      for (final user in map['Users']) {
        users.add(User.fromMap(user));
      }
    }
  }
}
