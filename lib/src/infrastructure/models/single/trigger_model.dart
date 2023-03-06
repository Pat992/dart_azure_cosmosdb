// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/core/enum/trigger_enum.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/base_model.dart';

/// Triggers are pieces of application logic that can be executed before (pre-triggers) and after (post-triggers) creation, deletion, and replacement of a document.
/// Triggers are written in JavaScript. Both pre and post triggers do no take parameters.
/// Like stored procedures, triggers live within the confines of a collection, thus confining the application logic to the collection.
class Trigger extends Base {
  /// **Description:** It is a user settable property. It is the body of the trigger.
  ///
  /// **Example:** 'function updateMetadata() { ... }'
  String body;

  /// **Description:** It is the type of operation that invokes the trigger. The acceptable values are: All, Insert, Replace and Delete.
  ///
  /// **Example:** TriggerOperation.all
  TriggerOperation triggerOperation;

  /// **Description:** This specifies when the trigger is fired. The acceptable values are: Pre and Post.
  /// Pre triggers fire before an operation while Post triggers after an operation.
  ///
  /// **Example:** TriggerType.post
  TriggerType triggerType;

  /// **Description:** Creates a [Trigger] model Object.
  ///
  /// **id:** The unique user generated name for the resource.
  /// The id field must not exceed 255 characters.
  ///
  /// [Type:] String *required*
  ///
  /// **body:** It is a user settable property. It is the body of the trigger.
  ///
  /// [Type:] String *required*
  ///
  /// **triggerOperation:** It is the type of operation that invokes the trigger. The acceptable values are: All, Insert, Replace and Delete.
  ///
  /// [Type:] TriggerOperation *required*
  ///
  /// **triggerType:** This specifies when the trigger is fired. The acceptable values are: Pre and Post.
  /// Pre triggers fire before an operation while Post triggers after an operation.
  ///
  /// [Type:] TriggerType *required*
  Trigger({
    required super.id,
    required this.body,
    required this.triggerOperation,
    required this.triggerType,
  }) : super(
          rid: '',
          ts: 0,
          self: '',
          etag: '',
          error: const {},
        );

  /// **Description:** Transforms the [Trigger] model to a Map for the CosmosDB API.
  @override
  Map<String, dynamic> toMap() {
    final superBody = super.toMap();

    if (error.isEmpty) {
      superBody.addAll({
        'body': body,
        'triggerOperation': triggerOperation.value,
        'triggerType': triggerType.value,
      });
    }

    return superBody;
  }

  /// **Description:** Transforms a Map from the CosmosDB API to the [Trigger] model.
  @override
  Trigger.fromMap(Map<String, dynamic> map)
      : body = map['body'] ?? '',
        triggerOperation = map['triggerOperation'] == 'All'
            ? TriggerOperation.all
            : map['triggerOperation'] == 'Create'
                ? TriggerOperation.create
                : map['triggerOperation'] == 'Replace'
                    ? TriggerOperation.replace
                    : TriggerOperation.delete,
        triggerType =
            map['triggerType'] == 'Pre' ? TriggerType.pre : TriggerType.post,
        super.fromMap(map);
}
