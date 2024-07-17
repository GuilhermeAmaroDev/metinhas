import 'package:flutter/material.dart';
import 'package:metinhas/app/notifiers/value_notifier.dart';
import 'categoria_model.dart';
import 'categoria_service.dart';

class CategoriaViewModel {
  final CategoriaService service;
  final MetasNotifier<CategoriaMeta> notifier;

  final Map<String, IconData> iconMap = {
    'Pessoal': Icons.person,
    'Financeira': Icons.attach_money,
    'Profissional': Icons.work,
    'Saúde': Icons.health_and_safety,
  };

  CategoriaViewModel(this.service, this.notifier) {
    initializeCategorias();
  }

  Future<void> initializeCategorias() async {
    final loadedCategorias = await service.getCategorias();
    notifier.value = loadedCategorias?.cast<CategoriaMeta>() ?? [
      CategoriaMeta(nome: 'Pessoal'),
      CategoriaMeta(nome: 'Financeira'),
      CategoriaMeta(nome: 'Profissional'),
      CategoriaMeta(nome: 'Saúde'),
    ];
  }

  void addCategoria(String nome) {
    final novaCategoria = CategoriaMeta(nome: nome);
    notifier.add(novaCategoria);
  }

  void updateCategoria(int index, CategoriaMeta categoria) {
    notifier.update(index, categoria);
  }

  void removeCategoria(int index) {
    notifier.removeAt(index);
  }

  IconData? getIconForCategoria(String nome) {
    return iconMap[nome];
  }
}
