import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:metinhas/app/metas/metas_repository.dart';
import 'package:metinhas/app/categoria/categoria_repository.dart';
import 'package:metinhas/app/metas/metas_model.dart';
import 'package:metinhas/app/categoria/categoria_model.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final CategoriaRepository categoriaRepository;
  final MetaRepository metaRepository;

  _AppControllerBase(this.categoriaRepository, this.metaRepository);

  @observable
  ValueNotifier<List<Categoria>> categoriasNotifier = ValueNotifier([]);

  @action
  Future<void> carregarCategorias() async {
    final categoriasDto = await categoriaRepository.getAll();
    categoriasNotifier.value = categoriasDto.map((dto) => Categoria.fromDto(dto)).toList();
  }

  @action
  Future<void> carregarMetas() async {
    for (final categoria in categoriasNotifier.value) {
      final metasDto = await metaRepository.getAll();
      categoria.metas = metasDto.map((dto) => Meta.fromDto(dto)).toList();
    }
    categoriasNotifier.value = List.from(categoriasNotifier.value);
  }
}
