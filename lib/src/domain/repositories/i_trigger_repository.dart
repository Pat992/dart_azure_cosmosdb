// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/core/enum/trigger_enum.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/models_barrel.dart';

/// Triggers are pieces of application logic that can be executed before (pre-triggers) and after (post-triggers) creation, deletion, and replacement of a document.
/// Triggers are written in JavaScript.
/// Both pre and post triggers do no take parameters.
/// Like stored procedures, triggers live within the confines of a collection, thus confining the application logic to the collection.
abstract class ITriggerRepository {
  /// **Description:** Performing a GET on the triggers resource of a particular database returns a list of the triggers in the collection.
  ///
  /// **dbId:** User generated name/id of the database.
  ///
  /// [Type:] String *required*
  ///
  /// **collectionId:** Id/name of the collection where the triggers reside.
  ///
  /// [Type:] String *required*
  Future<TriggerList> list({
    required String dbId,
    required String collectionId,
  });

  /// **Description:** The create-operation creates a new trigger in a collection.
  ///
  /// **dbId:** User generated name/id of the database.
  ///
  /// [Type:] String *required*
  ///
  /// **collectionId:** Id/name of the collection where the triggers is created.
  ///
  /// [Type:] String *required*
  ///
  /// **triggerId:** Unique name used to identify the trigger. The id must not exceed 255 characters.
  ///
  /// [Type:] String *required*
  ///
  /// **function:** The function of the trigger.
  ///
  /// [Type:] String *required*
  ///
  /// **triggerOperation:**	Type of operation that invokes the trigger.
  /// The acceptable values are: TriggerOperation.all, TriggerOperation.create, TriggerOperation.replace, and TriggerOperation.delete.
  ///
  /// [Type:] TriggerOperation *required*
  ///
  /// **triggerType:** This value specifies when the trigger is fired.
  /// The acceptable values are: TriggerType.pre and TriggerType.post.
  /// Pre triggers fire before an operation while Post triggers after an operation.
  ///
  /// [Type:] TriggerType *required*
  Future<Trigger> create({
    required String dbId,
    required String collectionId,
    required String triggerId,
    required String function,
    required TriggerOperation triggerOperation,
    required TriggerType triggerType,
  });

  /// **Description:** Performing a PUT operation on a specific trigger resource replaces the entire trigger resource.
  /// All user-settable properties, including the ID, the body, the triggerOperation, and the triggerType, must be submitted in the body to perform the replacement.
  ///
  /// **dbId:** User generated name/id of the database.
  ///
  /// [Type:] String *required*
  ///
  /// **collectionId:** Id/name of the collection where the triggers is replaced.
  ///
  /// [Type:] String *required*
  ///
  /// **triggerId:** Id/name of the trigger to replace.
  ///
  /// [Type:] String *required*
  ///
  /// **function:** The function of the trigger, will replace the current function.
  ///
  /// [Type:] String *required*
  ///
  /// **triggerOperation:**	It is the type of operation that invokes the trigger.
  /// The acceptable values are: TriggerOperation.all, TriggerOperation.create, TriggerOperation.replace, and TriggerOperation.delete.
  ///
  /// [Type:] TriggerOperation *required*
  ///
  /// **triggerType:** This value specifies when the trigger is fired.
  /// The acceptable values are: TriggerType.pre and TriggerType.post.
  /// Pre triggers fire before an operation while Post triggers after an operation.
  ///
  /// [Type:] TriggerType *required*
  Future<Trigger> replace({
    required String dbId,
    required String collectionId,
    required String triggerId,
    required String function,
    required TriggerOperation triggerOperation,
    required TriggerType triggerType,
  });

  /// **Description:** The delete-operation deletes an existing trigger in a collection.
  ///
  /// **dbId:** User generated name/id of the database.
  ///
  /// [Type:] String *required*
  ///
  /// **collectionId:** Id/name of the collection where the triggers is deleted from.
  ///
  /// [Type:] String *required*
  ///
  /// **triggerId:** Id/name of the trigger to delete.
  ///
  /// [Type:] String *required*
  Future<Trigger> delete({
    required String dbId,
    required String collectionId,
    required String triggerId,
  });
}
