class UniqueKeyPolicy {
  List<dynamic> uniqueKeys;

  UniqueKeyPolicy({
    this.uniqueKeys = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'uniqueKeys': [
        {'paths': uniqueKeys}
      ],
    };
  }

  UniqueKeyPolicy.fromMap(Map<String, dynamic> map)
      : uniqueKeys = map['uniqueKeys'][0]['paths'] as List<dynamic>;
}
