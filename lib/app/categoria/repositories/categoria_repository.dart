import 'package:metinhas/app/database/base_repository.dart';
import 'package:sqflite/sqflite.dart';
import '../dto/categoria_dto.dart';


class CategoriaRepository extends BaseRepository<CategoriaDto> {
  CategoriaRepository() : super();

  @override
  String get tableName => 'categorias';

  @override
  void createTable(Batch batch) async {
    batch.execute('''
      CREATE TABLE categorias (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL UNIQUE,
        icon INTEGER
      )
    ''');
    
    batch.execute("INSERT INTO categorias(nome) VALUES ('Profissional'), ('Pessoal'), ('Financeira'), ('Viagens'), ('Saúde'), ('Games')");
  }

  @override
  Future<List<CategoriaDto>> getAll({String? orderBy, String? where, List<dynamic>? whereArgs, int? limit, bool deletado = false, DatabaseExecutor? dbExecutor}) async {
    return super.getAll(
      orderBy: orderBy ?? 'nome COLLATE NOCASE',
      where: where,
      whereArgs: whereArgs,
      limit: limit,
      deletado: true,
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
  CategoriaDto fromMap(Map<String, dynamic> map) {
    return CategoriaDto.fromMap(map);
  }

  @override
  Map<String, dynamic> toMap(CategoriaDto dto) {
    return dto.toMap();
  }

}
