import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static const dbname = "feedback.db";
  static const dbVersion = 1;

  static const tableName = "feedbackTable";

  // DB column name
  static const colIndex = "columnIndex";
  static const email = "UserEmail";
  static const outlet = "OutletValue";
  static const feedbackType = "FeedbackValue";
  static const company = "CompanyValue";
  static const category = "CategoryValue";
  static const subCategory = "SubCategoryValue";
  static const genreOfFeedback = "GenreOfFeedback";
  static const feedback = "Feedback";
  static const feedbackImage = "FeedbackImage";
  static const image1 = "Image1";
  static const image2 = "Image2";
  static const image3 = "Image3";

  static Database? _database;
  DBHelper._privateConstructor();
  static final DBHelper instance = DBHelper._privateConstructor();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();

    return _database;
  }

  _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, dbname);

    return openDatabase(path, version: dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableName (
        $colIndex INTEGER PRIMARY KEY,
        $email TEXT NOT NULL,
        $feedbackType TEXT NOT NULL,
        $outlet TEXT NOT NULL,
        $company TEXT NOT NULL,
        $category TEXT NOT NULL,
        $subCategory TEXT NOT NULL,
        $genreOfFeedback TEXT NOT NULL,
        $feedback TEXT NOT NULL,
        $image1 TEXT,
        $image2 TEXT,
        $image3 TEXT
        )
    ''');
  }

  Future<void> putData(Map<String, dynamic> row) async {
    Database? db = await instance.database;

    await db!.insert(tableName, row);
  }

  Future<void> dropDB() async {
    Database? db = await instance.database;

    await db!.rawQuery('DROP DATABASE $feedback');
    // await db!.delete(tableName);
  }

  Future<List<Map<String, dynamic>>> getData(String _email) async {
    Database? db = await instance.database;

    return await db!.query(tableName, where: "UserEmail == ?", whereArgs: [_email]);
  }
}
