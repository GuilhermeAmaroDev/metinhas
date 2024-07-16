import 'package:metinhas/app/metas/metas_model.dart';

class CategoriaMeta {
  String nome;
  List<Meta> metas;

  CategoriaMeta({required this.nome, this.metas = const []});
}