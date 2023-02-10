abstract class ConflictResolutionPolicyEntity {
  String mode;
  String conflictResolutionPath;
  String conflictResolutionProcedure;

  ConflictResolutionPolicyEntity({
    this.mode = '',
    this.conflictResolutionPath = '',
    this.conflictResolutionProcedure = '',
  });
}
