// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/base_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/user_model.dart';

/// A list of CosmosDB users.
class UserList extends BaseList {
  /// **Description:** A list of CosmosDB users.
  ///
  /// **Example:** [[]]
  List<User> users = [];

  /// **Description:** Creates a [UserList] model Object.
  ///
  /// **users:** A list of CosmosDB users.
  ///
  /// [Type:] List<User> *optional*
  ///
  /// [Default value:] const [[]]
  UserList({
    this.users = const [],
  }) : super(
          error: const {},
          rid: '',
          count: 0,
        );

  /// **Description:** Transforms the [UserList] model to a Map for the CosmosDB API.
  @override
  Map<String, dynamic> toMap() {
    var body = super.toMap();

    if (error.isEmpty) {
      body.addAll({'Users': users.map((user) => user.toMap()).toList()});
    }

    return body;
  }

  /// **Description:** Transforms a Map from the CosmosDB API to the [UserList] model.
  @override
  UserList.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    if (map.containsKey('Users')) {
      for (final user in map['Users']) {
        users.add(User.fromMap(user));
      }
    }
  }
}
