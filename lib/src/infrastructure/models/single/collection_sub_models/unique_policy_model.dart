class UniqueKeyPolicy {
  List<dynamic> uniqueKeys;

  UniqueKeyPolicy({
    this.uniqueKeys = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'uniqueKeys': uniqueKeys,
    };
  }

  UniqueKeyPolicy.fromMap(Map<String, dynamic> map)
      : uniqueKeys = map['uniqueKeys'] as List<dynamic>;
}
