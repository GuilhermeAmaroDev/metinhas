import 'package:metinhas/app/metas/metas_model.dart';

class CategoriaMeta {
  final String nome;
  List<Meta> metas;

  CategoriaMeta({required this.nome, List<Meta>? metas})
      : metas = metas ?? [];
}