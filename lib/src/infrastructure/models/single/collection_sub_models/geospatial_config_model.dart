class GeospatialConfig {
  String type;

  GeospatialConfig({
    this.type = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
    };
  }

  GeospatialConfig.fromMap(Map<String, dynamic> map) : type = map['type'] ?? [];
}
