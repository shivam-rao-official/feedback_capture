import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ImageDBHelper {
  static const dbname = "image.db";
  static const dbVersion = 1;

  static const tableName = "imageTable";

  // DB column name
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

    await db!.delete(tableName);
  }

  Future<List<Map<String, dynamic>>> getImage() async {
    Database? db = await instance.database;

    return await db!.query(tableName);
  }
}
