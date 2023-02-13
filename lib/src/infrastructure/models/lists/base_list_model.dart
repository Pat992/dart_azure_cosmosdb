class BaseList {
  String rid = '';
  int count;
  Object error;

  BaseList({
    required this.error,
    required this.rid,
    required this.count,
  });

  Map<String, dynamic> toMap() {
    return {
      '_rid': rid,
      '_count': count,
      'error': error,
    };
  }

  BaseList.fromMap(Map<String, dynamic> map)
      : rid = map['_rid'] as String,
        count = map['_count'] as int,
        error = map['error'] as Object;
}
