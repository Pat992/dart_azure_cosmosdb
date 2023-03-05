// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/models_barrel.dart';

abstract class IUserDefinedFunctionRepository {
  Future<UserDefinedFunctionList> list({
    required String dbId,
    required String collectionId,
  });

  Future<UserDefinedFunction> create({
    required String dbId,
    required String collectionId,
    required String userDefinedFunctionId,
    required String function,
  });

  Future<UserDefinedFunction> replace({
    required String dbId,
    required String collectionId,
    required String userDefinedFunctionId,
    required String function,
  });

  Future<UserDefinedFunction> delete({
    required String dbId,
    required String collectionId,
    required String userDefinedFunctionId,
  });
}
