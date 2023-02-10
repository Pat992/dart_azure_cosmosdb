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
    this.rid = '',
    this.ts = 0,
    this.self = '',
    this.etag = '',
  });
}
