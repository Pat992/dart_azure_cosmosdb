import 'package:dart_azure_cosmosdb/src/domain/entities/single/base_entity.dart';

abstract class UserDefinedFunctionEntity extends BaseEntity {
  String body;

  UserDefinedFunctionEntity({
    super.error = const {},
    required super.id,
    required this.body,
  });
}
