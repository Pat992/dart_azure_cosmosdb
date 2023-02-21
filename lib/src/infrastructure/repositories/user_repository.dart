import 'package:dart_azure_cosmosdb/src/domain/repositories/i_user_repository.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/datasources/interfaces/i_user_datasource.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/user_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/user_model.dart';

class UserRepository implements IUserRepository {
  final IUserDatasource userDatasource;

  UserRepository({required this.userDatasource});

  @override
  Future<User> create({required String dbId, required String userId}) async {
    try {
      final res = await userDatasource.create(dbId: dbId, userId: userId);

      return User.fromMap(res);
    } catch (e) {
      return User.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }

  @override
  Future<User> delete({required String dbId, required String userId}) async {
    try {
      final res = await userDatasource.delete(dbId: dbId, userId: userId);

      if (res.isEmpty) {
        return User(id: userId);
      }

      return User.fromMap(res);
    } catch (e) {
      return User.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }

  @override
  Future<User> get({required String dbId, required String userId}) async {
    try {
      final res = await userDatasource.get(dbId: dbId, userId: userId);

      return User.fromMap(res);
    } catch (e) {
      return User.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }

  @override
  Future<UserList> list({required String dbId}) async {
    try {
      final res = await userDatasource.list(dbId: dbId);

      return UserList.fromMap(res);
    } catch (e) {
      return UserList.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }

  @override
  Future<User> replace({
    required String dbId,
    required String userId,
    required String newUserId,
  }) async {
    try {
      final res = await userDatasource.replace(
        dbId: dbId,
        userId: userId,
        newUserId: newUserId,
      );

      return User.fromMap(res);
    } catch (e) {
      return User.fromMap({
        'code': 'exception',
        'message': '$e',
      });
    }
  }
}
