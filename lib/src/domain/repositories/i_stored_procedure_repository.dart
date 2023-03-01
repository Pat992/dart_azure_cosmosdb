// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/models_barrel.dart';

abstract class IStoredProcedureRepository {
  Future<StoredProcedureList> list({
    required String dbId,
    required String collectionId,
  });

  Future<StoredProcedure> create({
    required String dbId,
    required String collectionId,
    required String storedProcedureId,
    required String function,
  });

  Future<StoredProcedure> replace({
    required String dbId,
    required String collectionId,
    required String storedProcedureId,
    required String function,
  });

  Future<StoredProcedure> delete({
    required String dbId,
    required String collectionId,
    required String storedProcedureId,
  });

  Future<Map<String, dynamic>> execute({
    required String dbId,
    required String collectionId,
    required String storedProcedureId,
    required List<dynamic> parameters,
  });
}
