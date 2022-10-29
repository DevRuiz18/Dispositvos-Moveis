import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB{
  DB._();
  static final DB instance = DB._();
  static Database? _database;

  get database async{
    if(_database != null) return _database;

    return await _initDatabase();
  }

  _initDatabase() async{
    return await openDatabase(
      join(await getDatabasesPath(), 'moviesapp.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, version) async {
    await db.execute(_movie);
    await db.execute(_ticket);
  }

  String get _movie => '''
    CREATE TABLE movie(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    image BLOB,
    title TEXT, 
    description TEXT,
    imdbscore REAL
    );
  ''';

  String get _ticket => '''
    CREATE TABLE ticket(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    runtime TEXT,
    room INTEGER,
    date TEXT,
    sessiontime TEXT,
    seat TEXT
    );
  ''';

}