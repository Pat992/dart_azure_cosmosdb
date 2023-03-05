// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/models_barrel.dart';

abstract class ICollectionRepository {
  Future<CollectionList> list({
    required String dbId,
  });

  Future<Collection> get({
    required String dbId,
    required String collectionId,
  });

  Future<Collection> create({
    required String dbId,
    required String collectionId,
    required String partitionKey,
    required int version,
  });

  Future<Collection> delete({
    required String dbId,
    required String collectionId,
  });
}
