class MetasDto {
  final int? id;
  final String descricao;
  final bool isCompleta;
  final int categoriaId;

  MetasDto({this.id, required this.descricao, this.isCompleta = false, required this.categoriaId});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descricao': descricao,
      'isCompleta': isCompleta ? 1 : 0,
      'categoriaId': categoriaId,
    };
  }

  static MetasDto fromMap(Map<String, dynamic> map) {
    return MetasDto(
      id: map['id'],
      descricao: map['descricao'],
      isCompleta: map['isCompleta'] == 1,
      categoriaId: map['categoriaId'],
    );
  }
}