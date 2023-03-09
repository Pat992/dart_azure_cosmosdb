import 'dart:convert';
import 'dart:io';

import 'package:dart_azure_cosmosdb/dart_azure_cosmosdb.dart';

//------------------------------------------------------------------------------------------------------------
// The provided code seems to be a command-line interface (CLI) program that connects to a CosmosDB database
// and allows the user to select a database and a collection to run a query against.
//
// It is a very basic example and can be expanded upon.
//------------------------------------------------------------------------------------------------------------
Future<void> main() async {
  CosmosDb cosmosDb;
  print('CosmosDB query runner');
  print(
      '---------------------------------------------------------------------------------------');

  // Connect to CosmosDB using connectToCosmosDb() function.
  cosmosDb = await connectToCosmosDb();

  // Select the database to run queries on using selectDatabase() function.
  final database = await selectDatabase(cosmosDb);

  // Select the collection to run queries on using selectCollection() function.
  final collection = await selectCollection(cosmosDb, database.id);

  // Run queries on the selected collection using runQuery() function.
  await runQuery(cosmosDb, database.id, collection.id);
}

// This function connects to CosmosDB by getting the connection URL and primary key from the user.
Future<CosmosDb> connectToCosmosDb() async {
  String? cosmosUrl;
  String? cosmosKey;

  // Get the connection URL and primary key from the user.
  while (cosmosUrl == null || cosmosKey == null) {
    print('Enter CosmosDB connection URL:');
    cosmosUrl = stdin.readLineSync(encoding: utf8);
    print('Enter CosmosDB key:');
    cosmosKey = stdin.readLineSync(encoding: utf8);
  }

  // Create an instance of CosmosDB with the provided URL and key.
  final cosmosDb = CosmosDb(connectionUri: cosmosUrl, primaryKey: cosmosKey);

  // List the databases to check if the connection is working.
  final databaseList = await cosmosDb.database.list();

  // If there is an error in the databaseList, prompt the user to enter the URL and key again.
  if (databaseList.error.isNotEmpty) {
    printError('Unable to SignIn, please try again.');
    return await connectToCosmosDb();
  }

  // Return the CosmosDB instance.
  return cosmosDb;
}

// This function prompts the user to select a database to run queries on.
Future<CosmosDatabase> selectDatabase(CosmosDb cosmosDb) async {
  String dbSelected = '';
  print(
      '---------------------------------------------------------------------------------------');
  printWarning('Select a Database:');
  final dbs = await cosmosDb.database.list();

  // Get the selected database index from the user.
  while (int.tryParse(dbSelected) == null ||
      int.parse(dbSelected) > (dbs.count - 1)) {
    dbs.databases.asMap().forEach((index, db) {
      print('$index: ${db.id}');
    });
    dbSelected = stdin.readLineSync(encoding: utf8) ?? '';

    // If the selected index is invalid, prompt the user to enter the index again.
    if (int.tryParse(dbSelected) == null ||
        int.parse(dbSelected) > (dbs.count - 1)) {
      printError('Invalid input, please try again.');
    }
  }

  // Return the selected CosmosDatabase.
  return dbs.databases[int.parse(dbSelected)];
}

// This function prompts the user to select a collection to run queries on.
Future<Collection> selectCollection(CosmosDb cosmosDb, String dbId) async {
  String collSelected = '';
  print(
      '---------------------------------------------------------------------------------------');
  printWarning('Select a Collection:');

  // Get all collections in the given database.
  final colls = await cosmosDb.collection.list(dbId: dbId);

  // Prompt user to select a collection and keep prompting until a valid input is entered.
  while (int.tryParse(collSelected) == null ||
      int.parse(collSelected) > (colls.count - 1)) {
    // Print all available collections and their corresponding index.
    colls.collections.asMap().forEach((index, db) {
      print('$index: ${db.id}');
    });

    collSelected = stdin.readLineSync(encoding: utf8) ?? '';

    // If user input is invalid, print an error message and prompt again.
    if (int.tryParse(collSelected) == null ||
        int.parse(collSelected) > (colls.count - 1)) {
      printError('Invalid input, please try again.');
    }
  }

  // Return the selected collection.
  return colls.collections[int.parse(collSelected)];
}

Future<void> runQuery(
    CosmosDb cosmosDb, String dbId, String collectionId) async {
  String? query = '';

  print(
      '---------------------------------------------------------------------------------------');

  // Prompt user to enter a query or exit.
  while (query != '0') {
    printWarning('Write a query or press 0 to exit:');
    query = stdin.readLineSync(encoding: utf8);

    // Execute the given query and print the result or an error message if the query fails.
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

// Print a warning message in yellow color.
void printWarning(String text) {
  print('\x1B[33m$text\x1B[0m');
}

// Print an error message in red color.
void printError(String text) {
  print('\x1B[31m$text\x1B[0m');
}
