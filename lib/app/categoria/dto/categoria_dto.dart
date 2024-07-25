import 'package:metinhas/app/metas/dto/metas_dto.dart';

class CategoriaDto {
  final int id;
  final String nome;
  final int? icon;
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
      'icon': icon,
      'metas': metas.map((meta) => meta.toMap()).toList(),
    };
  }

  factory CategoriaDto.fromMap(Map<String, dynamic> map) {
    return CategoriaDto(
      id: map['id'],
      nome: map['nome'],
      icon: map['icon'],
      metas: (map['metas'] as List).map((metaMap) => MetasDto.fromMap(metaMap)).toList(),
    );
  }
}
