import 'package:metinhas/app/categoria/categoria_dto.dart';
import 'package:sqflite/sqflite.dart';

class CategoriaRepository {
  final Database database;

  CategoriaRepository(this.database);

  Future<void> createTable() async {
    await database.execute('''
      CREATE TABLE IF NOT EXISTS categorias (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL UNIQUE,
        icon TEXT NOT NULL
      )
    ''');
  }

  Future<void> addCategoria(CategoriaDto categoria) async {
    await database.insert('categorias', categoria.toMap());
  }

  Future<List<CategoriaDto>> getAllCategorias() async {
    final List<Map<String, dynamic>> maps = await database.query('categorias');
    return List.generate(maps.length, (i) => CategoriaDto.fromMap(maps[i]));
  }

  Future<void> updateCategoria(CategoriaDto categoria) async {
    await database.update(
      'categorias',
      categoria.toMap(),
      where: 'id = ?',
      whereArgs: [categoria.id],
    );
  }

  Future<void> deleteCategoria(int id) async {
    await database.delete(
      'categorias',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
