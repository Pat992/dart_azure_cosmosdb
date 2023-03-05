// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/base_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/user_defined_function_model.dart';

class UserDefinedFunctionList extends BaseList {
  List<UserDefinedFunction> userDefinedFunctions = [];

  UserDefinedFunctionList({
    this.userDefinedFunctions = const [],
    super.error = const {},
    super.rid = '',
    super.count = 0,
  });

  @override
  Map<String, dynamic> toMap() {
    var body = super.toMap();

    if (error.isEmpty) {
      body.addAll({
        'UserDefinedFunctions': userDefinedFunctions
            .map((userDefinedFunction) => userDefinedFunction.toMap())
            .toList()
      });
    }

    return body;
  }

  @override
  UserDefinedFunctionList.fromMap(Map<String, dynamic> map)
      : super.fromMap(map) {
    if (map.containsKey('UserDefinedFunctions')) {
      for (final userDefinedFunction in map['UserDefinedFunctions']) {
        userDefinedFunctions
            .add(UserDefinedFunction.fromMap(userDefinedFunction));
      }
    }
  }
}
