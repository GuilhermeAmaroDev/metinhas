import 'package:metinhas/app/categoria/categoria_model.dart';

import '../dto/categoria_dto.dart';
import '../repositories/categoria_repository.dart';

class CategoriaService {
  final CategoriaRepository _repository;

  CategoriaService(this._repository);

  Future<void> addCategoria(CategoriaDto categoria) async {
    await _repository.insert(categoria.toMap());
  }
  Future<void> deletarCategoria(CategoriaDto categoria) async {
    await _repository.delete(categoria.id);
  }

  Future<List<Categoria>> getAllCategorias() async {
    final categoriaDtos = await _repository.getAll();
    return categoriaDtos.map((dto) => Categoria.fromDto(dto)).toList();
  }
}
