enum ResourceType {
  collections('colls'),
  dbs('dbs'),
  docs('docs'),
  permissions('permissions'),
  users('users'),
  attachments('attachments'),
  storedProcedures('sprocs'),
  userDefinedFunctions('udfs'),
  triggers('triggers'),
  offers('offers');

  final String value;

  const ResourceType(this.value);
}
