import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo/features/todo/data/models/todo_model.dart';

const String todo = "todo";
const String id = "id";
const String iconId = "iconId";
const String isDone = "isDone";
const String title = "title";
const String description = "description";
const String time = "time";

class TodoDataBase {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDataBase();
      return _db;
    } else {
      return _db;
    }
  }

  Future<Database> initDataBase() async {
    String pathDataBase = await getDatabasesPath();
    String pathDataBaseName = join(pathDataBase, 'todo.db');
    Database mydb = await openDatabase(pathDataBaseName, version: 1,onCreate: _onCraete);
    return mydb; 
  }

  _onCraete(Database database, int version) {
    database.execute('''
 CREATE TABLE todo (
     id INTEGER PRIMARY KEY AUTOINCREMENT,
     iconId INTEGER,
     isDone INTEGER,
     title TEXT,
     description TEXT,
     time TEXT
 )
''');
  }

  Future<int> insertTodo(TodoModel todoModel) async {
    Database? database = await db;
    int status = await database!.insert("todo", todoModel.toJson());
    return status;
  }

  Future<int> deleteTodo(int idTodo) async {
    Database? database = await db;
    int status = await database!.delete("todo", where: '$id = ?', whereArgs: [idTodo]);
    return status;
  }

  Future<List> getDoneTodo() async {
    Database? database = await db;
    List status = await database!
        .query("todo", columns: [id, iconId, isDone, title, description, time], where: '$isDone = ?', whereArgs: [1]);
    return status;
  }

  Future<List> getNotDoneTodo() async {
    Database? database = await db;
    List status = await database!
        .query("todo", columns: [id, iconId, isDone, title, description, time], where: '$isDone = ?', whereArgs: [0]);
    return status;
  }
}
