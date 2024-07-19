import 'package:metinhas/app/metas/metas_dto.dart';

class Meta {
  final String descricao;
  late final bool isCompleta;
  final int? id;

  Meta({ this.id, required this.descricao, this.isCompleta = false});

  factory Meta.fromDto(MetasDto dto) {
    return Meta(
      id: dto.id,
      descricao: dto.descricao,
      isCompleta: dto.isCompleta,
    );
  }

  MetasDto toDto() {
    return MetasDto(
      id: id ?? 0,
      descricao: descricao,
      isCompleta: isCompleta,
    );
  }
}
