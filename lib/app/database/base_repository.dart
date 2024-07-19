import 'package:sqflite/sqflite.dart';
import 'sqflite_helper.dart';

abstract class BaseRepository<T> {
  static const String dataHoraCriadoColumnName = 'data_hora_criado';
  static const String dataHoraUltimaAlteracaoColumnName = 'data_hora_ultima_alteracao';
  static const String dataHoraDeletadoColumnName = 'data_hora_deletado';

  BaseRepository();

  @override
  String get tableName;

  @override
  String get idColumnName => 'id_$tableName';

  Future<Database> get database async => await SqfliteHelper().database;

  T fromMap(Map<String, dynamic> map);
  Map<String, dynamic> toMap(T item);

  Future<int> insert(Map<String, dynamic> data) async {
    final dbClient = await database;
    return await dbClient.insert(tableName, data);
  }

  Future<int> update(Map<String, dynamic> data, int id) async {
    final dbClient = await database;
    return await dbClient.update(
      tableName,
      data,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> delete(int id) async {
    final db = await database;
    return await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<List<T>> getAll({String? orderBy, String? where, List<dynamic>? whereArgs, int? limit, bool deletado = false, DatabaseExecutor? dbExecutor}) async {
    final db = dbExecutor ?? await database;

    String and() => where == null ? '' : '$where AND ';

    if (!deletado) {
      where = '${and()}${BaseRepository.dataHoraDeletadoColumnName} IS NULL';
    }

    var result = await db.query(
      tableName,
      limit: limit,
      orderBy: orderBy,
      where: where,
      whereArgs: whereArgs,
    );

    List<T> list = result.map((e) => fromMap(e)).toList();

    return list;
  }

  Future<T?> getById(int id) async {
    final db = await database;
    final maps = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return fromMap(maps.first);
    }
    return null;
  }
}
