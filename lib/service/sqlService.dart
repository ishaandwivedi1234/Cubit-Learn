import 'package:sqflite/sqflite.dart';

class NutritionProvider {
  late Database db;

  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          create table nutrition ( 
          id integer primary key, 
          calories integer not null,
          protein integer not null,
          fats integer not null,
          name text not null
          )
    ''');
    });
  }

  NutritionProvider() {
   
  }

  insert({category, calories, protein, fats, name, id}) async {
    await db.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO nutrition(id, calories, protein,fats,name)VALUES($id, $calories, $protein,$fats,$name)');
    });
  }

  Future close() async => db.close();
}
