abstract class IUserRepository {
  Future<Map<String, dynamic>> list({
    required String dbId,
  });

  Future<Map<String, dynamic>> get({
    required String dbId,
    required String userId,
  });

  Future<Map<String, dynamic>> create({
    required String dbId,
    required String userId,
  });

  Future<Map<String, dynamic>> replace({
    required String dbId,
    required String userId,
    required String newUserId,
  });

  Future<Map<String, dynamic>> delete({
    required String dbId,
    required String userId,
  });
}
