import 'categoria_dto.dart';
import 'categoria_repository.dart';

class CategoriaService {
  final CategoriaRepository _repository;

  CategoriaService(this._repository);

  Future<void> addCategoria(CategoriaDto categoria) async {
    await _repository.insert(categoria.toMap());
  }
  Future<void> deletarCategoria(CategoriaDto categoria) async {
    await _repository.delete(categoria.id);
  }

  Future<List<CategoriaDto>> getCategorias() async {
    return await _repository.getAll();
  }
}
