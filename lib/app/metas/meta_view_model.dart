
import 'package:metinhas/app/categoria/categoria_model.dart';
import 'package:metinhas/app/notifiers/value_notifier.dart';
import 'metas_model.dart';

class MetaViewModel {
  final MetasNotifier<CategoriaMeta> notifier;

  MetaViewModel(this.notifier);

  void addMeta(String categoriaNome, String descricao) {
    final categoria = notifier.value.firstWhere((cat) => cat.nome == categoriaNome);
    final novaMeta = Meta(descricao: descricao);
    categoria.metas.add(novaMeta);
    notifier.value = List.from(notifier.value);
  }

  void updateMeta(String categoriaNome, int index) {
    final categoria = notifier.value.firstWhere((cat) => cat.nome == categoriaNome);
    final meta = categoria.metas[index];

    meta.isCompleta = !meta.isCompleta;
    notifier.value = List.from(notifier.value);
  }

  void removeMeta(String categoriaNome, int index) {
    final categoria = notifier.value.firstWhere((cat) => cat.nome == categoriaNome);
    categoria.metas.removeAt(index);
    notifier.value = List.from(notifier.value);
  }
}
