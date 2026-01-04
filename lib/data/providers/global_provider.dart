import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:report_maker/Data/DB_Helper/db_helper.dart';
import 'package:sqflite/sqflite.dart';

final getDatabaseProvider = FutureProvider<Database>((ref){
  return DatabaseHelper.instance.get_database;
});

final responseStateProvider = StateProvider<String?>((_)=>null);