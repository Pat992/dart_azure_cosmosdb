abstract class BaseEntity {
  String id;
  String rid;
  int ts;
  String self;
  String etag;
  Object error;

  BaseEntity({
    required this.id,
    required this.error,
    required this.rid,
    required this.ts,
    required this.self,
    required this.etag,
  });
}
