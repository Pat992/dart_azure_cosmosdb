abstract class PartitionKeyEntity {
  List<dynamic> paths = [];
  String kind;
  int? version;

  PartitionKeyEntity({
    required this.paths,
    this.kind = 'Hash',
    this.version = 1,
  });
}
