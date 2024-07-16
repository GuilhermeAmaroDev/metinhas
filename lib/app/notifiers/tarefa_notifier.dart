import 'package:flutter/foundation.dart';
import 'package:metinhas/app/meta_selecionada/meta_categoria_model.dart';
import 'package:metinhas/app/metas/metas_model.dart';

class MetasNotifier extends ValueNotifier<List<CategoriaMeta>> {
  MetasNotifier() : super([]) {
    _initializeCategorias();
  }

  void _initializeCategorias() {
    value = [
      CategoriaMeta(nome: 'Pessoal', metas: []),
      CategoriaMeta(nome: 'Financeira', metas: []),
      CategoriaMeta(nome: 'Profissional', metas: []),
      CategoriaMeta(nome: 'Saúde', metas: []),
    ];
  }

  void addMeta(String categoriaNome, String descricao) {
    final categoria = value.firstWhere((cat) => cat.nome == categoriaNome);
    categoria.metas.add(Meta(descricao: descricao));
    notifyListeners();
  }

  void atualizarMeta(String categoriaNome, int index) {
    final categoria = value.firstWhere((cat) => cat.nome == categoriaNome);
    categoria.metas[index].isCompleta = !categoria.metas[index].isCompleta;
    notifyListeners();
  }

  void excluirMeta(String categoriaNome, int index) {
    final categoria = value.firstWhere((cat) => cat.nome == categoriaNome);
    categoria.metas.removeAt(index);
    notifyListeners();
  }
}