import 'dart:convert';
import 'package:bookdubaisafari/app/data/getModels/getCartData.dart';

import 'package:bookdubaisafari/app/data/getModels/getwishListData.dart';
import 'package:bookdubaisafari/app/data/postModels/savecardDetails.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'rahuser_database.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE cards (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            cardHolderName TEXT,
            cardNumber TEXT,
            cvv TEXT,
            expiryDate TEXT,
            cardType TEXT
          )
        ''');
    db.execute('''
      CREATE TABLE activity_table(
        _id INTEGER PRIMARY KEY,
        json_data TEXT NOT NULL
      )
    ''');
    db.execute('''
      CREATE TABLE wishlist_table(
        _id INTEGER PRIMARY KEY,
        json_data TEXT NOT NULL
      )
    ''');
  }

  // Insert card into the database
  Future<int> insertCard(CardDetailsModel card) async {
    final db = await database;
    return await db.insert(
      'cards',
      card.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Fetch all cards
  Future<List<CardDetailsModel>> getCards() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('cards');

    return List.generate(maps.length, (i) {
      return CardDetailsModel.fromJson(maps[i]);
    });
  }

  // Delete a card by id
  Future<int> deleteCard(int id) async {
    final db = await database;
    return await db.delete('cards', where: 'id = ?', whereArgs: [id]);
  }

  //add to card code
  // Insert data
  Future<int> insertactivity(GetCartDataModel getcartdatamodel) async {
    try {
      Database db = await database;
      String jsonData = getCartDataToJson(getcartdatamodel);

      return await db.insert('activity_table', {
        'json_data': jsonData,
      });
      
    } catch (e) {
      print(e);
      return 0;
    }
  }

  // Get all activities
  Future<List<GetCartDataModel>> fetchCartDataFromDatabase() async {
    Database db = await database;

    // Query the 'activity_table'
    var result = await db.query('activity_table');

    // Decode the JSON strings and map to GetCartDataModel
    List<GetCartDataModel> data = result
        .map((e) {
          String? jsonString = e['json_data'] as String?;

          if (jsonString != null) {
            Map<String, dynamic> jsonMap = jsonDecode(jsonString);
            jsonMap['_id'] = e['_id']; // Add _id to the JSON map
            return GetCartDataModel.fromJson(jsonMap);
          }
          return null;
        })
        .whereType<GetCartDataModel>()
        .toList();

    return data;
  }

  // // Get activity by ID
  // Future<Activity?> getActivityById(int id) async {
  //   Database db = await database;
  //   var result =
  //       await db.query('activity_table', where: '_id = ?', whereArgs: [id]);
  //   return result.isNotEmpty
  //       ? Activity.fromJson(json.decode(result.first['json_data'] as String))
  //       : null;
  // }

  // Delete activity by ID
  Future<int> delete(int id) async {
    Database db = await database;
    return await db.delete('activity_table', where: '_id = ?', whereArgs: [id]);
  }

  // // Update activity
  // Future<int> update(Activity activity) async {
  //   Database db = await database;
  //   String jsonData = getSubCategoriesToJson(activity);
  //   return await db.update(
  //     'activity_table',
  //     {'json_data': jsonData},
  //     where: '_id = ?',
  //     whereArgs: [activity.id],
  //   );
  // }

  // Insert data
  Future<int> addToWishList(GetWishListData getwishlistdata) async {
    try {
      Database db = await database;
      String jsonData = getWishlistDataToJson(getwishlistdata);

      return await db.insert('wishlist_table', {
        'json_data': jsonData,
      });
    } catch (e) {
      print(e);
      return 0;
    }
  }

  // Get activity by ID
  Future<bool> removeFromWishList(int id) async {
    try {
      Database db = await database;
      var result =
          await db.delete('wishlist_table', where: '_id = ?', whereArgs: [id]);
      return result > 0;
    } catch (e) {
      print("Error deleting item: $e");
      return false;
    }
  }

  // Get all activities
  Future<List<GetWishListData>> fetchWishlistDataFromDatabase() async {
    Database db = await database;

    // Query the 'activity_table'
    var result = await db.query('wishlist_table');

    // Decode the JSON strings and map to GetCartDataModel
    List<GetWishListData> data = result
        .map((e) {
          String? jsonString = e['json_data'] as String?;

          if (jsonString != null) {
            Map<String, dynamic> jsonMap = jsonDecode(jsonString);
            jsonMap['_id'] = e['_id']; // Add _id to the JSON map
            return GetWishListData.fromJson(jsonMap);
          }
          return null;
        })
        .whereType<GetWishListData>()
        .toList();

    return data;
  }
}
