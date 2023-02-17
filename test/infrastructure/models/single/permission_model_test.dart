import 'dart:convert';

import 'package:dart_azure_cosmosdb/src/core/enum/permission_enum.dart';
import 'package:dart_azure_cosmosdb/src/infrastructure/models/single/permission_model.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  test('Model is a correct map when created manually', () {
    // arrange
    final permissionMap = json.decode(fixture('permission-success.json'));
    final permission = Permission(
        id: "a_permission",
        permissionMode: PermissionMode.read,
        resource: "dbs/volcanodb/colls/volcano1",
        rid: "Sl8fAG8cXgBn6Ju2GqNsAA==",
        ts: 1449604760,
        self:
            "dbs\/Sl8fAA==\/users\/Sl8fAG8cXgA=\/permissions\/Sl8fAG8cXgBn6Ju2GqNsAA==\/",
        etag: "\"00000e00-0000-0000-0000-566736980000\"",
        token:
            "type=resource&ver=1&sig=ocPyc9QQFybITu1EqzX0kg==;w+WR1aWafB3+yZq5JSoBwgz78XDlU+k9Xiqvc+Q7TlAl1P4h4t721Cn5cjhZ9h3TSd2\/MJLy+wG+YkhDL9UlGkVv05RZGy2fMaLGdeQkWc7TShkc\/M2boPc3GXq2yiERKl5CN4AZWSOcrFhOFuuTOqF4ZdBlflmNudaakodr\/8qTip0i+a7moz1Jkc5+9iLAsDFyqTR1sirp7kAVNFbiqPdYTjNkvZUHF3nYYmRskOg=;");
    // act
    // assert
    expect(permission.toMap(), permissionMap);
  });

  test('Model has a correct error when created manually', () {
    // arrange
    final errorMap = json.decode(fixture('general-error.json'));
    final permission = Permission(
      id: '1',
      permissionMode: PermissionMode.all,
      resource: 'testResource',
      error: {
        "code": "BadRequest",
        "message":
            "Request url is invalid.\r\nActivityId: 9e68f294-7603-4502-a009-6b5dff0a2759, Microsoft.Azure.Documents.Common/2.14.0"
      },
    );
    // act
    // assert
    expect(permission.toMap(), errorMap);
  });

  test('Model is correct for any kind of api endpoint', () {
    // arrange
    final permissionMap = json.decode(fixture('permission-success.json'));
    // act
    final permission = Permission.fromMap(permissionMap);
    // assert
    expect(permission.toMap(), permissionMap);
  });

  test('Model has an error object', () {
    // arrange
    final errorMap = json.decode(fixture('general-error.json'));
    // act
    final permission = Permission.fromMap(errorMap);
    // assert
    expect(permission.toMap(), errorMap);
  });
}
