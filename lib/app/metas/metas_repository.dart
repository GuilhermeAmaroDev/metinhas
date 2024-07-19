import 'package:metinhas/app/database/base_repository.dart';
import 'package:sqflite/sqflite.dart';

import 'metas_dto.dart';



class MetaRepository extends BaseRepository<MetasDto> {
  MetaRepository() : super();

  @override
  String get tableName => 'metas';

  @override
  void createTable(Batch batch) async {
    batch.execute('''
      CREATE TABLE IF NOT EXISTS metas (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao TEXT NOT NULL,
        isCompleta INTEGER NOT NULL,
        categoriaId INTEGER NOT NULL,
        FOREIGN KEY (categoriaId) REFERENCES categorias (id) ON DELETE CASCADE
      )
    ''');
  }

  @override
  Future<List<MetasDto>> getAll({String? orderBy, String? where, List<dynamic>? whereArgs, int? limit, bool deletado = false, DatabaseExecutor? dbExecutor}) async {
    return super.getAll(
      orderBy: orderBy ?? 'nome COLLATE NOCASE',
      where: where,
      whereArgs: whereArgs,
      limit: limit,
      deletado: deletado,
      dbExecutor: dbExecutor,
    );
  }

  @override
  Future<int> insert(Map<String, dynamic> data) async {
    final dbClient = await database;
    return await dbClient.insert(tableName, data);
  }

  @override
  Future<int> update(Map<String, dynamic> data, int id) async {
    final dbClient = await database;
    return await dbClient.update(
      tableName,
      data,
      where: 'id = ?',
      whereArgs: [id],
    );
  }


  @override
  Future<int> delete(int id) async {
    final dbClient = await database;
    return await dbClient.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  MetasDto fromMap(Map<String, dynamic> map) {
    return MetasDto.fromMap(map);
  }

  @override
  Map<String, dynamic> toMap(MetasDto dto) {
    return dto.toMap();
  }

}
