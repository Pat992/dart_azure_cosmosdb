// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/models_barrel.dart';

abstract class IDatabaseRepository {
  Future<CosmosDatabaseList> list();

  Future<CosmosDatabase> get({
    required String dbId,
  });

  Future<CosmosDatabase> create({
    required String dbId,
  });

  Future<CosmosDatabase> delete({
    required String dbId,
  });
}
