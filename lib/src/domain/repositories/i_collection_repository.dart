abstract class ICollectionRepository {
  Future<Map<String, dynamic>> list({required String dbId});

  Future<Map<String, dynamic>> get({
    required String dbId,
    required String collectionId,
  });

  Future<Map<String, dynamic>> create({
    required String dbId,
    required String collectionId,
    required String partitionKey,
    required bool isBigPartKey,
  });

  Future<Map<String, dynamic>> delete({
    required String dbId,
    required String collectionId,
  });
}
