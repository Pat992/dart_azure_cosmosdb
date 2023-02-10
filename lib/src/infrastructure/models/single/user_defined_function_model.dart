import 'package:dart_azure_cosmosdb/src/domain/entities/single/user_defined_function_entity.dart';

class UserDefinedFunction extends UserDefinedFunctionEntity {
  UserDefinedFunction({
    super.body = '',
    required super.id,
    super.rid = '',
    super.ts = 0,
    super.self = '',
    super.etag = '',
    super.error = const {},
  });

  Map<String, dynamic> toMap() {
    return {
      'body': body,
      'id': id,
      '_rid': rid,
      '_ts': ts,
      '_self': self,
      '_etag': etag,
    };
  }

  factory UserDefinedFunction.fromMap(Map<String, dynamic> map) {
    return UserDefinedFunction(
      body: map['body'] as String,
      id: map['id'] as String,
      rid: map['_rid'] as String,
      ts: map['_ts'] as int,
      self: map['_self'] as String,
      etag: map['_etag'] as String,
      error: map['error'] as Object,
    );
  }
}
