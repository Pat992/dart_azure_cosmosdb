import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/base_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/user_defined_function_model.dart';

class UserDefinedFunctionList extends BaseList {
  List<UserDefinedFunction> userDefinedFunctions;

  UserDefinedFunctionList({
    this.userDefinedFunctions = const [],
    super.error = const {},
    super.rid = '',
    super.count = 0,
  });

  @override
  Map<String, dynamic> toMap() {
    var body = super.toMap();

    body.addAll({
      'UserDefinedFunctions': userDefinedFunctions,
    });

    return body;
  }

  @override
  UserDefinedFunctionList.fromMap(Map<String, dynamic> map)
      : userDefinedFunctions =
            map['UserDefinedFunctions'] as List<UserDefinedFunction>,
        super.fromMap(map);
}
