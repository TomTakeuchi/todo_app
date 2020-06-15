import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseConnection {
  setDataBase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_todo');
    var dataBase =
        await openDatabase(path, version: 1, onCreate: _onCreatingDataBase);
    return dataBase;
  }

  _onCreatingDataBase(Database db, int version) async {
    await db.execute(//01
        'CREATE TABLE todos(id INTEGER PRIMARY KEY ,name TEXT,deadLine TEXT,isDone INTEGER)');
  }
}
