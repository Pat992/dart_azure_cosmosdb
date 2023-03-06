// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/base_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/user_defined_function_model.dart';

/// A list of CosmosDB user defined functions.
class UserDefinedFunctionList extends BaseList {
  /// **Description:** A list of CosmosDB user defined functions.
  ///
  /// **Example:** [[]]
  List<UserDefinedFunction> userDefinedFunctions = [];

  /// **Description:** Creates a [UserDefinedFunctionList] model Object.
  ///
  /// **userDefinedFunctions:** A list of CosmosDB user defined functions.
  ///
  /// [Type:] List<UserDefinedFunction> *optional*
  ///
  /// [Default value:] const [[]]
  UserDefinedFunctionList({
    this.userDefinedFunctions = const [],
  }) : super(
          error: const {},
          rid: '',
          count: 0,
        );

  /// **Description:** Transforms the [UserDefinedFunctionList] model to a Map for the CosmosDB API.
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

  /// **Description:** Transforms a Map from the CosmosDB API to the [UserDefinedFunctionList] model.
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
