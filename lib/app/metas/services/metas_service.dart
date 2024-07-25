import '../dto/metas_dto.dart';
import '../repositories/metas_repository.dart';

class MetaService {
  final MetaRepository repository;

  MetaService(this.repository);

  Future<void> addMeta(MetasDto meta) async {
    await repository.insert(meta.toMap());
  }

  Future<List<MetasDto>> getMetas(int categoriaId) async {
    return await repository.getAll();
  }
}
