import 'package:flutter/material.dart';
import 'package:metinhas/app/metas/metas_model.dart';

import 'dto/categoria_dto.dart';

class Categoria {
  final String nome;
  final IconData? icon;
  List<Meta> metas;
  final int? id;

  Categoria({required this.nome, this.icon, this.metas = const [], this.id});

  factory Categoria.fromDto(CategoriaDto dto) {
    return Categoria(
      id: dto.id,
      nome: dto.nome,
      icon: dto.icon,
      metas: dto.metas.map((metaDto) => Meta.fromDto(metaDto)).toList(),
    );
  }

  CategoriaDto toDto() {
    return CategoriaDto(
      id: id ?? 0,
      nome: nome,
      icon: icon,
      metas: metas.map((meta) => meta.toDto()).toList(),
    );
  }
}
