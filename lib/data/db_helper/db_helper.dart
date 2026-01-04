import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{
  static final DatabaseHelper instance = DatabaseHelper._internal();
  static Database? database;

  DatabaseHelper._internal();

  factory DatabaseHelper()=>instance;

  // it can return you a database
  Future<Database> get get_database async{
    if(database != null) return database!;
    database = await _initDatabase();
    return database!;
  }

  // it can initiate database and open the database for opertaions
  Future<Database> _initDatabase() async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath,'report_maker_database.db');

    return await openDatabase(path,version: 1);
  }
}