enum TriggerOperation {
  all('All'),
  create('Create'),
  replace('Replace'),
  delete('Delete');

  final String value;

  const TriggerOperation(this.value);
}

enum TriggerType {
  pre('Pre'),
  post('Post');

  final String value;

  const TriggerType(this.value);
}
