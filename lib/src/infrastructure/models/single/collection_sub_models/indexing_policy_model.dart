import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_sub_models/path_model.dart';

class IndexingPolicy {
  String indexingMode = 'consistent';
  bool automatic = true;
  List<IncludedPath> includedPaths = [];
  List<ExcludedPath> excludedPaths = [];

  IndexingPolicy({
    this.indexingMode = 'consistent',
    this.automatic = true,
    required this.includedPaths,
    required this.excludedPaths,
  });

  Map<String, dynamic> toMap() {
    return {
      'indexingMode': indexingMode,
      'automatic': automatic,
      'includedPaths': includedPaths,
      'excludedPaths': excludedPaths,
    };
  }

  IndexingPolicy.fromMap(Map<String, dynamic> map) {
    indexingMode = map['indexingMode'] ?? '';
    automatic = map['automatic'] ?? true;
    for (Map<String, dynamic> ip in map['includedPaths']) {
      includedPaths.add(IncludedPath.fromMap(ip));
    }
    for (Map<String, dynamic> ep in map['excludedPaths']) {
      excludedPaths.add(ExcludedPath.fromMap(ep));
    }
  }
}