abstract class IStoredProcedure {
  Future<Map<String, dynamic>> list({
    required String dbId,
    required String collectionId,
  });

  Future<Map<String, dynamic>> create({
    required String dbId,
    required String collectionId,
    required String storedProcedureId,
    required String function,
  });

  Future<Map<String, dynamic>> replace({
    required String dbId,
    required String collectionId,
    required String storedProcedureId,
    required String function,
  });

  Future<Map<String, dynamic>> delete({
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
