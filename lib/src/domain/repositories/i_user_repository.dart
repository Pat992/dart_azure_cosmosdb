import 'package:dart_azure_cosmosdb/src/infrastructure/models/models_barrel.dart';

abstract class IUserRepository {
  Future<UserList> list({
    required String dbId,
  });

  Future<User> get({
    required String dbId,
    required String userId,
  });

  Future<User> create({
    required String dbId,
    required String userId,
  });

  Future<User> replace({
    required String dbId,
    required String userId,
    required String newUserId,
  });

  Future<User> delete({
    required String dbId,
    required String userId,
  });
}
