import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfliteHelper {
  static final SqfliteHelper _instance = SqfliteHelper._internal();
  factory SqfliteHelper() => _instance;

  static const int _dbVersion = 1;
  static const String _dbName = 'metinhas.db';

  Database? _database;

  SqfliteHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _dbName);
    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE categorias (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        icon TEXT NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE metas (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        titulo TEXT NOT NULL,
        descricao TEXT,
        categoriaId INTEGER,
        FOREIGN KEY (categoriaId) REFERENCES categorias (id)
      )
    ''');
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      // Add migration logic here
      // For example, if you add a new column:
      // await db.execute('ALTER TABLE categorias ADD COLUMN nova_coluna TEXT');
    }
  }
}
