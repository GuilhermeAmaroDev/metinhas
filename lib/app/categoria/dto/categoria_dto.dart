import 'package:flutter/cupertino.dart';
import 'package:metinhas/app/metas/dto/metas_dto.dart';

class CategoriaDto {
  final int id;
  final String nome;
  final IconData? icon;
  final List<MetasDto> metas;

  CategoriaDto({
    required this.id,
    required this.nome,
    this.icon,
    required this.metas,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'icon': icon?.codePoint,
      'metas': metas.map((meta) => meta.toMap()).toList(),
    };
  }

  factory CategoriaDto.fromMap(Map<String, dynamic> map) {
    return CategoriaDto(
      id: map['id'] as int,
      nome: map['nome'] as String,
      icon: map['icon'] != null ? IconData(map['icon'], fontFamily: 'MaterialIcons') : null,
      metas: map['metas'] != null ? (map['metas'] as List).map((metaMap) => MetasDto.fromMap(metaMap)).toList() : [],
    );
  }
}
