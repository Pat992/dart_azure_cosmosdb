class Base {
  String id;
  String rid;
  int ts;
  String self;
  String etag;
  Map<String, String> error;

  Base({
    required this.id,
    required this.error,
    required this.rid,
    required this.ts,
    required this.self,
    required this.etag,
  });

  Base.fromMap(Map<String, dynamic> map)
      : id = map['id'] ?? '',
        rid = map['_rid'] ?? '',
        ts = map['_ts'] ?? 0,
        self = map['_self'] ?? '',
        etag = map['_etag'] ?? '',
        error = map['code'] && map['message']
            ? {'code': map['code'], 'message': map['message']}
            : {};

  Map<String, dynamic> toMap() {
    if (error.isNotEmpty) {
      return {
        'code': error['code'],
        'message': error['message'],
      };
    }
    return {
      'id': id,
      '_rid': rid,
      '_ts': ts,
      '_self': self,
      '_etag': etag,
    };
  }
}
