import 'package:flutter/foundation.dart';
import 'package:metinhas/app/metas/metas_model.dart';


class MetasNotifier extends ValueNotifier<List<Meta>> {
  MetasNotifier() : super ([]);

  void addMeta(String descricao) {
    value = [...value, Meta(descricao: descricao)];
  }

  void atualizarMeta(int index) {
    if (index >= 0 && index < value.length) {
      var meta = value [index];
      var atualizarMeta = Meta(descricao: meta.descricao, isCompleta: !meta.isCompleta);
      value = [...value]..[index] = atualizarMeta;
    }
  }

  void excluirMeta(int index){
    if (index >= 0 && index < value.length) {
      value = [...value]..removeAt(index);
    }
  }
}