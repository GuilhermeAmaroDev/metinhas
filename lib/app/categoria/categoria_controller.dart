import 'package:flutter/material.dart';
import 'package:metinhas/app/notifiers/value_notifier.dart';

import 'categoria_model.dart';
import 'categoria_service.dart';


class CategoriaController {
  CategoriaService service;

  CategoriaController(this.service);

  late final MetasNotifier<Categoria> metasNotifier;

  Future<void> loadCategorias() {
    return initializeCategorias();
  }

  void addCategoria(String nome) {
    final novaCategoria = Categoria(id: 0, nome: nome);
    service.addCategoria(novaCategoria.toDto());
  }

  // void updateCategoria(int index, Categoria categoria) {
  //   viewModel.notifier.update(index, categoria);
  // }
  //
  // void removeCategoria(int index) {
  //   service.deletarCategoria();
  // }

  final Map<String, IconData> iconMap = {
    'Pessoal': Icons.person,
    'Financeira': Icons.attach_money,
    'Profissional': Icons.work,
    'Saúde': Icons.health_and_safety,
  };


  Future<void> initializeCategorias() async {
    final loadedCategorias = await service.getCategorias();
    loadedCategorias?.cast<Categoria>() ?? [
      Categoria(id: 1, nome: 'Pessoal'),
      Categoria(id: 2, nome: 'Financeira'),
      Categoria(id: 3, nome: 'Profissional'),
      Categoria(id: 4, nome: 'Saúde'),
    ];
  }
}
