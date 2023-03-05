// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
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
