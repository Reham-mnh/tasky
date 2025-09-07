import 'package:path/path.dart' as path;

import 'package:sqflite/sqflite.dart';
import 'package:tasky/models/task.dart';

class AppDatabase {
  static const _dbName = 'tasky.db';
  static const _dbVersion = 1;
  static const tabletask = 'tasky';

  static final AppDatabase _appDatabase = AppDatabase._();
  AppDatabase._();

  factory AppDatabase() => _appDatabase;

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _open();
    return _database!;
  }

  Future<Database> _open() async {
    final dbpath = await getDatabasesPath();
    final fullPath = path.join(dbpath, _dbName);
    return await openDatabase(
      fullPath,
      version: _dbVersion,
      onCreate: (db, version) {
        db.execute('''
             CREATE TABLE $tabletask(
             id INTEGER PRIMARY KEY AUTOINCREMENT,
             taskName TEXT NOT NULL,
             description TEXT,
             isDone INTEGER NOT NULL DEFAULT 0
             );
        ''');
      },
      onUpgrade: (db,oldVersion,newVersion){}
    );
  }
  insertTask(TaskModel model)async{
   final db=await database;
   return db.insert(
    tabletask,
    model.toJson(),
    conflictAlgorithm: ConflictAlgorithm.ignore,

   );
  }
  updateTask(TaskModel model)async{
    final db=await database;
    return db.update(tabletask, model.toJson(),
    where: 'id = ?',
    whereArgs: [model.id]
    );
  }
 Future<List<TaskModel>> getTasks()async{
   final db=await database;
    final rows=await db.query(tabletask,);
   return rows.map((e)=>TaskModel.fromJson(e)).toList();
  }
  Future<List<TaskModel>>getSelectedTasks()async{
    final db=await database;
    final rows=await db.query(tabletask,
    where: 'isDone=?',
    whereArgs: [1]
    );
    return rows.map((e)=>TaskModel.fromJson(e)).toList();
  }
  Future<List<TaskModel>>getunSelectedTasks()async{
    final db=await database;
    final rows=await db.query(tabletask,
    where: 'isDone=?',
    whereArgs: [0]
    );
    return rows.map((e)=>TaskModel.fromJson(e)).toList();
  }
   
}
