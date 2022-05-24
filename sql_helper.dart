import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  var database;

  void createDB() async {
    database = await sql.openDatabase('note.db', version: 1,
        onCreate: (database, version) {
      print('database created');
      database.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT, description TEXT, createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)');
      print('Table created');
    }, onOpen: (database) {
      print('database opened');
    });
  }

  static List<Map> tasks = [];

  insertNewNote({String? title, String? description}) async {
    await database.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO tasks(title, description) VALUES("$title","$description")');
    });
    await getFromDatabase();
  }

  updateOnDatabase({int? id, String? title, String? description}) async {
    await database.rawUpdate(
        'UPDATE tasks SET title = ?, description = ? WHERE id = ?',
        [title, description, id]);
  }

  getFromDatabase() async {
    tasks = await database.rawQuery('SELECT * FROM tasks');
  }

  deleteFromDatabase(int id) async {
    await database.rawDelete('DELETE FROM tasks WHERE id = ?', [id]);
  }
}
