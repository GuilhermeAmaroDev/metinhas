import 'categoria_dto.dart';
import 'categoria_repository.dart';


class CategoriaService {
  final CategoriaRepository _repository;

  CategoriaService(this._repository);

  Future<void> addCategoria(CategoriaDto categoria) async {
    await _repository.addCategoria(categoria);
  }

  Future<List<CategoriaDto>> getCategorias() async {
    return await _repository.getAllCategorias();
  }
}
