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

  void addCategoria(String nome, IconData icon) {
    final novaCategoria = Categoria(id: 0, nome: nome, icon: icon);
    service.addCategoria(novaCategoria.toDto());
    categoriasNotifier.add(novaCategoria);
  }

  final Map<String, IconData> iconMap = {
    'Pessoal': Icons.person,
    'Financeira': Icons.attach_money,
    'Profissional': Icons.work,
    'Saúde': Icons.health_and_safety,
    'Games': Icons.videogame_asset,
    'Viagens': Icons.airplanemode_active,
  };


  Future<void> initializeCategorias() async {
    final categorias = await service.getAllCategorias();
    categoriasNotifier.addAll(categorias);
  }
}
