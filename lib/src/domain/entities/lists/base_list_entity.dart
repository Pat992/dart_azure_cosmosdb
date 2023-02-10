abstract class BaseListEntity {
  String rid = '';
  int count;
  Object error;

  BaseListEntity({
    required this.error,
    this.rid = '',
    this.count = 0,
  });
}
