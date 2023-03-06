// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

/// For Azure Cosmos DB accounts configured with multiple write regions, update conflicts can occur when writers concurrently update the same item in multiple regions.
class ConflictResolutionPolicy {
  /// **Description:** You can select from two conflict resolution policies on an Azure Cosmos DB container:
  ///
  /// **Last Write Wins (LWW):** This resolution policy, by default, uses a system-defined timestamp property.
  /// It's based on the time-synchronization clock protocol.
  /// If you use the API for NoSQL, you can specify any other custom numerical property (e.g., your own notion of a timestamp) to be used for conflict resolution.
  ///
  /// **Custom:** This resolution policy is designed for application-defined semantics for reconciliation of conflicts.
  /// When you set this policy on your Azure Cosmos DB container, you also need to register a merge stored procedure.
  /// This procedure is automatically invoked when conflicts are detected under a database transaction on the server.
  ///
  /// **Example:** 'LastWriterWins'
  String mode;

  /// **Description:** If you use the API for NoSQL, you can specify any other custom numerical property (e.g., your own notion of a timestamp) to be used for conflict resolution.
  /// A custom numerical property is also referred to as the conflict resolution path.
  ///
  /// **Example:** '/_ts'
  String conflictResolutionPath;

  /// **Description:** In case of the custom-mode, this is set to the registered merge stored procedure.
  ///
  /// **Example:** ''
  String conflictResolutionProcedure;

  /// **Description:** Creates a [ConflictResolutionPolicy] model Object.
  ///
  /// **mode:** The resolution policy on an Azure Cosmos DB container.
  ///
  /// [Type:] String *optional* (LastWriterWins or Custom)
  ///
  /// [Default value:] '' (sets the mode to LastWriterWins)
  ///
  /// **conflictResolutionPath:** Custom numerical property (e.g., your own notion of a timestamp) to be used for conflict resolution.
  ///
  /// [Type:] String *optional*
  ///
  /// [Default value:] '' (Sets the conflictResolutionPath to '/_ts')
  ///
  /// **conflictResolutionProcedure:** In case of the custom-mode, this is set to the registered merge stored procedure.
  ///
  /// [Type:] String *optional*
  ///
  /// [Default value:] ''
  ConflictResolutionPolicy({
    this.mode = '',
    this.conflictResolutionPath = '',
    this.conflictResolutionProcedure = '',
  });

  /// **Description:** Transforms the [ConflictResolutionPolicy] model to a Map for the CosmosDB API.
  Map<String, dynamic> toMap() {
    return {
      'mode': mode,
      'conflictResolutionPath': conflictResolutionPath,
      'conflictResolutionProcedure': conflictResolutionProcedure,
    };
  }

  /// **Description:** Transforms a Map from the CosmosDB API to the [ConflictResolutionPolicy] model.
  ConflictResolutionPolicy.fromMap(Map<String, dynamic> map)
      : mode = map['mode'] ?? '',
        conflictResolutionPath = map['conflictResolutionPath'] ?? '',
        conflictResolutionProcedure = map['conflictResolutionProcedure'] ?? '';
}
