abstract class IDatabaseDatasource {
  Future<Map<String, dynamic>> list();

  Future<Map<String, dynamic>> get({
    required String dbId,
  });

  Future<Map<String, dynamic>> create({
    required String dbId,
  });

  Future<Map<String, dynamic>> delete({
    required String dbId,
  });
}
