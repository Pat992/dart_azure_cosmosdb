class ConflictResolutionPolicy {
  String mode;
  String conflictResolutionPath;
  String conflictResolutionProcedure;

  ConflictResolutionPolicy({
    this.mode = '',
    this.conflictResolutionPath = '',
    this.conflictResolutionProcedure = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'mode': mode,
      'conflictResolutionPath': conflictResolutionPath,
      'conflictResolutionProcedure': conflictResolutionProcedure,
    };
  }

  ConflictResolutionPolicy.fromMap(Map<String, dynamic> map)
      : mode = map['mode'] ?? '',
        conflictResolutionPath = map['conflictResolutionPath'] ?? '',
        conflictResolutionProcedure = map['conflictResolutionProcedure'] ?? '';
}
