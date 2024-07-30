import 'package:metinhas/app/categoria/repositories/categoria_repository.dart';
import 'package:metinhas/app/metas/repositories/metas_repository.dart';
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
    final batch = db.batch();

    CategoriaRepository().createTable(batch);
    MetaRepository().createTable(batch);

    await batch.commit();
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      // Add migration logic here
      // For example, if you add a new column:
      // await db.execute('ALTER TABLE categorias ADD COLUMN nova_coluna TEXT');
    }
  }
}
