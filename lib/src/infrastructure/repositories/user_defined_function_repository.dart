// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/domain/repositories/i_user_defined_function_repository.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_user_defined_function_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/user_defined_function_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/user_defined_function_model.dart';

class UserDefinedFunctionRepository implements IUserDefinedFunctionRepository {
  final IUserDefinedFunctionDatasource userDefinedFunctionDatasource;

  UserDefinedFunctionRepository({required this.userDefinedFunctionDatasource});

  @override
  Future<UserDefinedFunction> create({
    required String dbId,
    required String collectionId,
    required String userDefinedFunctionId,
    required String function,
  }) async {
    try {
      final res = await userDefinedFunctionDatasource.create(
        dbId: dbId,
        collectionId: collectionId,
        userDefinedFunctionId: userDefinedFunctionId,
        function: function,
      );

      return UserDefinedFunction.fromMap(res);
    } catch (e) {
      return UserDefinedFunction.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }

  @override
  Future<UserDefinedFunction> delete({
    required String dbId,
    required String collectionId,
    required String userDefinedFunctionId,
  }) async {
    try {
      final res = await userDefinedFunctionDatasource.delete(
        dbId: dbId,
        collectionId: collectionId,
        userDefinedFunctionId: userDefinedFunctionId,
      );

      if (res.isEmpty) {
        return UserDefinedFunction(id: userDefinedFunctionId, body: '');
      }

      return UserDefinedFunction.fromMap(res);
    } catch (e) {
      return UserDefinedFunction.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }

  @override
  Future<UserDefinedFunctionList> list({
    required String dbId,
    required String collectionId,
  }) async {
    try {
      final res = await userDefinedFunctionDatasource.list(
        dbId: dbId,
        collectionId: collectionId,
      );

      return UserDefinedFunctionList.fromMap(res);
    } catch (e) {
      return UserDefinedFunctionList.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }

  @override
  Future<UserDefinedFunction> replace({
    required String dbId,
    required String collectionId,
    required String userDefinedFunctionId,
    required String function,
  }) async {
    try {
      final res = await userDefinedFunctionDatasource.replace(
        dbId: dbId,
        collectionId: collectionId,
        userDefinedFunctionId: userDefinedFunctionId,
        function: function,
      );

      return UserDefinedFunction.fromMap(res);
    } catch (e) {
      return UserDefinedFunction.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }
}
