import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/core/enum/permission_enum.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/lists/permission_list_model.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/permission_model.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  test('Model is a correct map when created manually', () {
    // arrange
    final permissionListModel = PermissionList(
      count: 1,
      error: {},
      rid: 'Sl8fAG8cXgA=',
      permissions: [
        Permission(
          id: "a_permission",
          permissionMode: PermissionMode.read,
          resource: "dbs/volcanodb/colls/volcano1",
          rid: "Sl8fAG8cXgBn6Ju2GqNsAA==",
          ts: 1449604760,
          self:
              "dbs\/Sl8fAA==\/users\/Sl8fAG8cXgA=\/permissions\/Sl8fAG8cXgBn6Ju2GqNsAA==\/",
          etag: "\"00000e00-0000-0000-0000-566736980000\"",
          token:
              "type=resource&ver=1&sig=lxKlPHeqlIx2\/J02rFs3jw==;20MwFhNUO9xNOuglK9gyL18Mt5xIhbN48pzSq6FaR\/7sKFtGd6GaxCooIoPP6rYxRHUeCabHOFkbIeT4ercXk\/F1FG70QkQTD9CxDqNJx3NImgZJWErK1NlEjxkpFDV5uslhpJ4Y3JBnc72\/vlmR95TibFS0rC\/cdND0uRvoOOWXZYvVAJFKEUKyy3GTlYOxY1nKT313ZCOSUQF7kldjo9DE3XEBf8cct1uNKMILImo=;",
        ),
      ],
    );
    final permissionListMap =
        json.decode(fixture('permission-list-success.json'));
    // act
    // assert
    expect(permissionListModel.toMap(), permissionListMap);
  });

  test('Model has a correct error when created manually', () {
    // arrange
    final permissionListModel = PermissionList(
      error: {
        "code": "BadRequest",
        "message":
            "Request url is invalid.\r\nActivityId: 9e68f294-7603-4502-a009-6b5dff0a2759, Microsoft.Azure.Documents.Common/2.14.0"
      },
      rid: '',
      count: 0,
    );
    final errorMap = json.decode(fixture('general-error.json'));
    // act
    // assert
    expect(permissionListModel.toMap(), errorMap);
  });

  test('Model is correct for any kind of api endpoint', () {
    // arrange
    final permissionListMap =
        json.decode(fixture('permission-list-success.json'));
    // act
    final permissionListModel = PermissionList.fromMap(permissionListMap);
    // assert
    expect(permissionListModel.toMap(), permissionListMap);
  });

  test('Model has an error object', () {
    // arrange
    final errorMap = json.decode(fixture('general-error.json'));
    // act
    final permissionListModel = PermissionList.fromMap(errorMap);
    // assert
    expect(permissionListModel.toMap(), errorMap);
  });
}
