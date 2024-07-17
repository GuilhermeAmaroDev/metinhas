import 'metas_dto.dart';
import 'metas_repository.dart';

class MetaService {
  final MetaRepository repository;

  MetaService(this.repository);

  Future<void> addMeta(MetasDto meta) async {
    await repository.addMeta(meta);
  }

  Future<List<MetasDto>> getMetas(int categoriaId) async {
    return await repository.getMetas(categoriaId);
  }
}
