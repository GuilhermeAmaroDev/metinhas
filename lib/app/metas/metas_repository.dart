import 'package:metinhas/app/metas/metas_dto.dart';
import 'package:sqflite/sqflite.dart';


class MetaRepository {
  final Database database;

  MetaRepository(this.database);

  Future<void> createTable() async {
    await database.execute('''
      CREATE TABLE IF NOT EXISTS metas (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao TEXT NOT NULL,
        isCompleta INTEGER NOT NULL,
        categoriaId INTEGER NOT NULL,
        FOREIGN KEY (categoriaId) REFERENCES categorias (id) ON DELETE CASCADE
      )
    ''');
  }

  Future<void> addMeta(MetasDto meta) async {
    await database.insert('metas', meta.toMap());
  }

  Future<List<MetasDto>> getMetas(int categoriaId) async {
    final List<Map<String, dynamic>> maps = await database.query(
      'metas',
      where: 'categoriaId = ?',
      whereArgs: [categoriaId],
    );
    return List.generate(maps.length, (i) => MetasDto.fromMap(maps[i]));
  }

  Future<void> updateMeta(MetasDto meta) async {
    await database.update(
      'metas',
      meta.toMap(),
      where: 'id = ?',
      whereArgs: [meta.id],
    );
  }

  Future<void> deleteMeta(int id) async {
    await database.delete(
      'metas',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteAllMetas(int categoriaId) async {
    await database.delete(
      'metas',
      where: 'categoriaId = ?',
      whereArgs: [categoriaId],
    );
  }
}
