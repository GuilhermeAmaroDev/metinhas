import 'package:flutter/material.dart';
import 'package:metinhas/app/metas/metas_model.dart';

class CategoriaMeta {
  final int? id;
  final String nome;
  List<Meta> metas;
  final IconData? icon;

  CategoriaMeta({this.id, required this.nome, this.icon, this.metas = const []});
}