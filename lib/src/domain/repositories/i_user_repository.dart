// Copyright 2023 Patrick Hettich. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:dart_azure_cosmosdb/src/infrastructure/models/models_barrel.dart';

/// A user is a logical namespace for scoping permissions on collections, documents, attachment, stored procedures, triggers, and user-defined functions.
/// The user construct lives under a database resource and thus cannot cross the database boundary it is under.
/// The user resource is represented by users in the Azure Cosmos DB REST resource model.
/// It is a system resource, and thus contains a fixed schema.
abstract class IUserRepository {
  /// **Description:** Performing a GET operation on the users resource of a particular database, i.e. the users URI path.
  ///
  /// **dbId:** The value is the user generated name/id of the database the users reside.
  ///
  /// [Type:] String *required*
  Future<UserList> list({
    required String dbId,
  });

  /// **Description:** Performing a GET operation on a single user with his id/name.
  ///
  /// **dbId:** User generated name/id of the database the user resides in.
  ///
  /// [Type:] String *required*
  ///
  /// **userId:** The id/name of the user.
  ///
  /// [Type:] String *required*
  Future<User> get({
    required String dbId,
    required String userId,
  });

  /// **Description:** The create-operation creates a new user in a database.
  ///
  /// **dbId:** User generated name/id of the database the user is created in.
  ///
  /// [Type:] String *required*
  ///
  /// **userId:** The user generated unique name for the user.
  /// No two users share the same id value. It is a string that must not be more than 255 characters.
  ///
  /// [Type:] String *required*
  Future<User> create({
    required String dbId,
    required String userId,
  });

  /// **Description:** PUT operation on the specific user resource to replace the entire user resource.
  /// The only replaceable property is the id of the user. This replace operation does not impact the permissions of the user.
  ///
  /// **dbId:** User generated name/id of the database the user is replaced in.
  ///
  /// [Type:] String *required*
  ///
  /// **userId:** The id/name of the user to replace.
  ///
  /// [Type:] String *required*
  ///
  /// **userId:** The new unique id/name of the user.
  ///
  /// [Type:] String *required*
  Future<User> replace({
    required String dbId,
    required String userId,
    required String newUserId,
  });

  /// **Description:** The delete-operation deletes an existing user in a database.
  ///
  /// **dbId:** User generated name/id of the database the user is deleted from.
  ///
  /// [Type:] String *required*
  ///
  /// **userId:** The id/name of the user to delete.
  ///
  /// [Type:] String *required*
  Future<User> delete({
    required String dbId,
    required String userId,
  });
}
