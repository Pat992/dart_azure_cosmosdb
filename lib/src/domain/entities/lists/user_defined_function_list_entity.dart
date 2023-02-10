import 'package:dart_azure_cosmosdb/src/domain/entities/lists/base_list_entity.dart';
import 'package:dart_azure_cosmosdb/src/domain/entities/single/user_defined_function_entity.dart';

abstract class UserDefinedFunctionListEntity extends BaseListEntity {
  List<UserDefinedFunctionEntity> userDefinedFunctions;

  UserDefinedFunctionListEntity({
    super.error = const {},
    this.userDefinedFunctions = const [],
  });
}
