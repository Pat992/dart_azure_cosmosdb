import 'dart:convert';
import 'dart:io';

import 'package:dart_azure_cosmosdb/dart_azure_cosmosdb.dart';

Future<void> main() async {
  CosmosDb cosmosDb;
  print('CosmosDB query runner');
  print(
      '---------------------------------------------------------------------------------------');

  cosmosDb = await connectToCosmosDb();

  final database = await selectDatabase(cosmosDb);

  final collection = await selectCollection(cosmosDb, database.id);

  await runQuery(cosmosDb, database.id, collection.id);
}

Future<CosmosDb> connectToCosmosDb() async {
  String? cosmosUrl;
  String? cosmosKey;
  while (cosmosUrl == null && cosmosKey == null) {
    print('Enter CosmosDB connection URL:');
    cosmosUrl = stdin.readLineSync(encoding: utf8);
    print('Enter CosmosDB key:');
    cosmosKey = stdin.readLineSync(encoding: utf8);
  }

  final cosmosDb = CosmosDb(connectionUri: cosmosUrl!, primaryKey: cosmosKey!);

  final databaseList = await cosmosDb.database.list();

  if (databaseList.error.isNotEmpty) {
    printError('Unable to SignIn, please try again.');
    return await connectToCosmosDb();
  }

  print(databaseList.databases[0].id);
  return cosmosDb;
}

Future<CosmosDatabase> selectDatabase(CosmosDb cosmosDb) async {
  String dbSelected = '';
  print(
      '---------------------------------------------------------------------------------------');
  printWarning('Select a Database:');
  final dbs = await cosmosDb.database.list();

  while (int.tryParse(dbSelected) == null ||
      int.parse(dbSelected) > (dbs.count - 1)) {
    dbs.databases.asMap().forEach((index, db) {
      print('$index: ${db.id}');
    });
    dbSelected = stdin.readLineSync(encoding: utf8) ?? '';

    if (int.tryParse(dbSelected) == null ||
        int.parse(dbSelected) > (dbs.count - 1)) {
      printError('Invalid input, please try again.');
    }
  }

  return dbs.databases[int.parse(dbSelected)];
}

Future<Collection> selectCollection(CosmosDb cosmosDb, String dbId) async {
  String collSelected = '';
  print(
      '---------------------------------------------------------------------------------------');
  printWarning('Select a Collection:');
  final colls = await cosmosDb.collection.list(dbId: dbId);

  while (int.tryParse(collSelected) == null ||
      int.parse(collSelected) > (colls.count - 1)) {
    colls.collections.asMap().forEach((index, db) {
      print('$index: ${db.id}');
    });
    collSelected = stdin.readLineSync(encoding: utf8) ?? '';

    if (int.tryParse(collSelected) == null ||
        int.parse(collSelected) > (colls.count - 1)) {
      printError('Invalid input, please try again.');
    }
  }

  return colls.collections[int.parse(collSelected)];
}

Future<void> runQuery(
    CosmosDb cosmosDb, String dbId, String collectionId) async {
  String? query = '';

  print(
      '---------------------------------------------------------------------------------------');

  while (query != '0') {
    printWarning('Write a query or press 0 to exit:');
    query = stdin.readLineSync(encoding: utf8);

    final result = await cosmosDb.document.query(
      dbId: dbId,
      collectionId: collectionId,
      query: query ?? '',
    );

    if (result['message'] != null) {
      printError(result['code']);
      printError(result['message']);
    } else {
      print(json.encode(result));
    }
  }
}

void printWarning(String text) {
  print('\x1B[33m$text\x1B[0m');
}

void printError(String text) {
  print('\x1B[31m$text\x1B[0m');
}
