// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/domain/repositories/i_stored_procedure_repository.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_stored_procedure_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/stored_procedure_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/stored_procedure_model.dart';

class StoredProcedureRepository extends IStoredProcedureRepository {
  final IStoredProcedureDatasource storedProcedureDatasource;

  StoredProcedureRepository({required this.storedProcedureDatasource});

  @override
  Future<StoredProcedure> create({
    required String dbId,
    required String collectionId,
    required String storedProcedureId,
    required String function,
  }) async {
    try {
      final res = await storedProcedureDatasource.create(
        dbId: dbId,
        collectionId: collectionId,
        storedProcedureId: storedProcedureId,
        function: function,
      );

      return StoredProcedure.fromMap(res);
    } catch (e) {
      return StoredProcedure.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }

  @override
  Future<StoredProcedure> delete({
    required String dbId,
    required String collectionId,
    required String storedProcedureId,
  }) async {
    try {
      final res = await storedProcedureDatasource.delete(
        dbId: dbId,
        collectionId: collectionId,
        storedProcedureId: storedProcedureId,
      );

      if (res.isEmpty) {
        return StoredProcedure(
          id: storedProcedureId,
          body: '',
        );
      }

      return StoredProcedure.fromMap(res);
    } catch (e) {
      return StoredProcedure.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }

  @override
  Future<Map<String, dynamic>> execute({
    required String dbId,
    required String collectionId,
    required String storedProcedureId,
    required List parameters,
  }) async {
    try {
      final res = await storedProcedureDatasource.execute(
        dbId: dbId,
        collectionId: collectionId,
        storedProcedureId: storedProcedureId,
        parameters: parameters,
      );

      return res;
    } catch (e) {
      return {
        'code': 'exception',
        'message': '$e',
      };
    }
  }

  @override
  Future<StoredProcedureList> list({
    required String dbId,
    required String collectionId,
  }) async {
    try {
      final res = await storedProcedureDatasource.list(
        dbId: dbId,
        collectionId: collectionId,
      );

      return StoredProcedureList.fromMap(res);
    } catch (e) {
      return StoredProcedureList.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }

  @override
  Future<StoredProcedure> replace({
    required String dbId,
    required String collectionId,
    required String storedProcedureId,
    required String function,
  }) async {
    try {
      final res = await storedProcedureDatasource.replace(
        dbId: dbId,
        collectionId: collectionId,
        storedProcedureId: storedProcedureId,
        function: function,
      );

      return StoredProcedure.fromMap(res);
    } catch (e) {
      return StoredProcedure.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }
}
