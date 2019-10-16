import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:keaton/constants/constants.dart';

class DBHelper {

  static Future<sql.Database> database() async{
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath,'${Constants.DB_NAME}'), onCreate: (db,version){
      return db.execute('CREATE TABLE ${Constants.CLOTHING_TABLE}(id TEXT PRIMARY KEY, name TEXT, description TEXT, image TEXT, brand TEXT, colorName TEXT, season TEXT, purchasedDate TEXT, createdDate TEXT, lastWornDate TEXT, size TEXT, timesWorn TEXT)');
    }, version: 1);
  }
  static Future<void> insert(String table, Map<String,Object> data) async{
    final sql.Database sqlDb = await DBHelper.database();
    sqlDb.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String,dynamic>>> getData(String table) async{
    final sql.Database sqlDb = await DBHelper.database();
    return sqlDb.query(table);
  }

  static Future<void> delete(String pickedTable, String pickedId) async{
    final sql.Database sqlDb = await DBHelper.database();
    return sqlDb.delete(pickedTable,where: 'id = ?',whereArgs: [pickedId]);
  }
}