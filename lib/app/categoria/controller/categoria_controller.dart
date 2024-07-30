import 'package:flutter/material.dart';
import 'package:metinhas/app/notifiers/value_notifier.dart';
import '../categoria_model.dart';
import '../services/categoria_service.dart';

class CategoriaController {
  CategoriaService service;
  ValueNotifierList<Categoria> categoriasNotifier = ValueNotifierList([]);

  CategoriaController(this.service);

  Future<void> loadCategorias() async {
    await initializeCategorias();
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
    final categorias = await service.getAllCategorias();
    categoriasNotifier.addAll(categorias);
  }
}
