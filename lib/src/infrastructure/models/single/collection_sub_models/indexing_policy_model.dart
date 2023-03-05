// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/collection_sub_models/path_model.dart';

/// As documents are added to a collection, Cosmos DB by default automatically indexes the documents, thus allowing documents to be queried.
/// It is at the collection level that you configure the indexing policy.
/// Since indexing policy is set at the collection level, each collection within a database can have different indexing policies.
class IndexingPolicy {
  /// **Description:** By default, the indexing mode is Consistent.
  /// This means that indexing occurs synchronously during insertion, replacement, or deletion of documents.
  /// To have indexing occur asynchronously, set the indexing mode to lazy.
  ///
  /// **Example:** 'consistent'
  String indexingMode = 'consistent';

  /// **Description:** Indicates whether automatic indexing is on or off.
  /// The default value is True, thus all documents are indexed.
  /// Setting the value to False would allow manual configuration of indexing paths.
  ///
  /// **Example:** true
  bool automatic = true;

  /// **Description:** The array containing document paths to be indexed.
  /// By default, two paths are included: the / path, which specifies that all document paths be indexed, and the _ts path, which indexes for a timestamp range comparison.
  ///
  /// **Example:** []
  List<IncludedPath> includedPaths = [];

  /// **Description:** The array containing document paths to be excluded from indexing.
  ///
  /// **Example:** []
  List<ExcludedPath> excludedPaths = [];

  /// **Description:** Creates a [IndexingPolicy] model Object.
  ///
  /// **indexingMode:** By default, the indexing mode is Consistent.
  /// This means that indexing occurs synchronously during insertion, replacement, or deletion of documents.
  /// To have indexing occur asynchronously, set the indexing mode to lazy.
  ///
  /// [Type:] String *optional* ('consistent' or 'lazy')
  ///
  /// [Default value:] 'consistent'
  ///
  /// **automatic:** Indicates whether automatic indexing is on or off.
  /// The default value is True, thus all documents are indexed.
  /// Setting the value to False would allow manual configuration of indexing paths.
  ///
  /// [Type:] bool *optional*
  ///
  /// [Default value:] true
  ///
  /// **includedPaths:** The array containing document paths to be indexed.
  /// By default, two paths are included: the / path, which specifies that all document paths be indexed, and the _ts path, which indexes for a timestamp range comparison.
  ///
  /// [Type:] List<IncludedPath>
  ///
  /// **includedPaths:** The array containing document paths to be excluded from indexing.
  ///
  /// [Type:] List<ExcludedPath>
  IndexingPolicy({
    this.indexingMode = 'consistent',
    this.automatic = true,
    required this.includedPaths,
    required this.excludedPaths,
  });

  /// **Description:** Transforms the [IndexingPolicy] model to a Map for the CosmosDB API.
  Map<String, dynamic> toMap() {
    return {
      'indexingMode': indexingMode,
      'automatic': automatic,
      'includedPaths':
          includedPaths.map((includedPath) => includedPath.toMap()).toList(),
      'excludedPaths':
          excludedPaths.map((excludedPath) => excludedPath.toMap()).toList(),
    };
  }

  /// **Description:** Transforms a Map from the CosmosDB API to the [IndexingPolicy] model.
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
