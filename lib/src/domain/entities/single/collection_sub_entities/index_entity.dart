abstract class IndexEntity {
  String kind;
  String dataType;
  int precision;

  IndexEntity({
    this.kind = 'Range',
    this.precision = -1,
    required this.dataType,
  });
}
