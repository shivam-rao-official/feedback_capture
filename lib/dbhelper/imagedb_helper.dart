import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ImageDBHelper {
  static const dbname = "image.db";
  static const dbVersion = 1;

  static const tableName = "imageTable";

  // DB column name
  static const email = "UserEmail";
  static const colIndex = "columnIndex";
  static const image1 = "Image1";
  static const image2 = "Image2";
  static const image3 = "Image3";

  static Database? _database;
  ImageDBHelper._privateConstructor();
  static final ImageDBHelper instance = ImageDBHelper._privateConstructor();

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
        $image1 TEXT,
        $image2 TEXT,
        $image3 TEXT
        )
    ''');
  }

  Future<void> putImage(Map<String, dynamic> row) async {
    Database? db = await instance.database;

    await db!.insert(tableName, row);
  }

  Future<void> dropDB() async {
    Database? db = await instance.database;
    await db!.rawQuery('DROP TABLE $tableName');
    // await db!.delete(tableName);
  }

  Future<List<Map<String, dynamic>>> getImage(_email, _id) async {
    Database? db = await instance.database;

    return await db!
        .query(tableName, where: "UserEmail == ? AND columnIndex == ?", whereArgs: [_email, _id]);
  }
}
