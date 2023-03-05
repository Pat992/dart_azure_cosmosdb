// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/core/enum/trigger_enum.dart';

/// Datasource to send requests to the Azure CosmosDB SQL api,
/// responsible for triggers.
abstract class ITriggerDatasource {
  /// **Description:** Lists all the triggers in a collection.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the collection is located.
  ///
  /// String collectionId - Collection in which the the triggers are located.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> list({
    required String dbId,
    required String collectionId,
  });

  /// **Description:** Create a new trigger in a collection.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the the collection is located.
  ///
  /// String collectionId - Collection in which the the trigger will be located.
  ///
  /// String triggerId - Id of the trigger.
  ///
  /// String function - The function of the trigger.
  ///
  /// TriggerOperation triggerOperation - trigger operation.
  ///
  /// TriggerType triggerType - trigger type.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  create({
    required String dbId,
    required String collectionId,
    required String triggerId,
    required String function,
    required TriggerOperation triggerOperation,
    required TriggerType triggerType,
  });

  /// **Description:** Replace an existing trigger in a collection.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the the collection is located.
  ///
  /// String collectionId - Collection in which the the trigger is located.
  ///
  /// String triggerId - Id of the trigger.
  ///
  /// String function - The function of the trigger.
  ///
  /// TriggerOperation triggerOperation - trigger operation.
  ///
  /// TriggerType triggerType - trigger type.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> replace({
    required String dbId,
    required String collectionId,
    required String triggerId,
    required String function,
    required TriggerOperation triggerOperation,
    required TriggerType triggerType,
  });

  /// **Description:** Delete an existing trigger in a collection.
  ///
  /// **Parameter:**
  ///
  /// String dbId - Database in which the the collection is located.
  ///
  /// String collectionId - Collection in which the the trigger is located.
  ///
  /// String triggerId - Id of the trigger.
  ///
  /// **Returns:** Future<Map<String, dynamic>>.
  Future<Map<String, dynamic>> delete({
    required String dbId,
    required String collectionId,
    required String triggerId,
  });
}
