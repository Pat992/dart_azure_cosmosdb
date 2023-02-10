import 'package:dart_azure_cosmosdb/src/domain/entities/single/database_entity.dart';

class Database extends DatabaseEntity {
  Database({
    super.colls = '',
    super.users = '',
    required super.id,
    super.rid = '',
    super.ts = 0,
    super.self = '',
    super.etag = '',
    super.error = const {},
  });

  Map<String, dynamic> toMap() {
    return {
      'colls': colls,
      'users': users,
      'id': id,
      '_rid': rid,
      '_ts': ts,
      '_self': self,
      '_etag': etag,
    };
  }

  factory Database.fromMap(Map<String, dynamic> map) {
    return Database(
      colls: map['colls'] as String,
      users: map['users'] as String,
      id: map['id'] as String,
      rid: map['_rid'] as String,
      ts: map['_ts'] as int,
      self: map['_self'] as String,
      etag: map['_etag'] as String,
      error: map['error'] as Object,
    );
  }
}
