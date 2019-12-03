import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:keaton/constants/constants.dart';

class DBHelper {

  static Future<sql.Database> database() async{
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath,'${Constants.DB_NAME}'), onCreate: (db,version){
      return db.execute('CREATE TABLE ${Constants.CLOTHING_TABLE}(id TEXT PRIMARY KEY, ${Constants.NAME_COLUMN_NAME} TEXT, ${Constants.DESCRIPTION_COLUMN_NAME} TEXT, ${Constants.IMAGE_COLUMN_NAME} TEXT, ${Constants.BRAND_COLUMN_NAME} TEXT, ${Constants.COLORNAME_COLUMN_NAME} TEXT, ${Constants.SEASON_COLUMN_NAME} TEXT, ${Constants.PURCHASEDDATE_COLUMN_NAME} TEXT, ${Constants.CREATEDDATE_COLUMN_NAME} TEXT, ${Constants.LASTWORNDATE_COLUMN_NAME} TEXT, ${Constants.SIZE_COLUMN_NAME} TEXT, ${Constants.TIMESWORN_COLUMN_NAME} TEXT, ${Constants.TYPE_COLUMN_NAME} TEXT)');
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

  static Future<List<Map<String, dynamic>>> getAllBrands() async{
    final sql.Database sqlDb = await DBHelper.database();
    return sqlDb.rawQuery('SELECT ${Constants.BRAND_COLUMN_NAME} FROM ${Constants.CLOTHING_TABLE}');
  }

  static Future<List<Map<String, dynamic>>> getAllColors() async{
    final sql.Database sqlDb = await DBHelper.database();
    return sqlDb.rawQuery('SELECT ${Constants.COLORNAME_COLUMN_NAME} FROM ${Constants.CLOTHING_TABLE}');
  }

  static Future<List<Map<String, dynamic>>> getAllSizes() async{
    final sql.Database sqlDb = await DBHelper.database();
    return sqlDb.rawQuery('SELECT ${Constants.SIZE_COLUMN_NAME} FROM ${Constants.CLOTHING_TABLE}');
  } 

  static Future<List<Map<String, dynamic>>> getAllTypes() async{
    final sql.Database sqlDb = await DBHelper.database();
    return sqlDb.rawQuery('SELECT ${Constants.TYPE_COLUMN_NAME} FROM ${Constants.CLOTHING_TABLE}');
  } 

  static Future<List<Map<String, dynamic>>> customQuery(String _customQuery) async{
    final sql.Database sqlDb = await DBHelper.database();
    if(_customQuery != null && _customQuery.isNotEmpty){
      return sqlDb.rawQuery(_customQuery);
    }else{
      return null;
    }
  } 
}