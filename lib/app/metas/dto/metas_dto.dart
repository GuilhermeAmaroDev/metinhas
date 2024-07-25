class MetasDto {
  final int id;
  final String descricao;
  final bool isCompleta;

  MetasDto({
    required this.id,
    required this.descricao,
    required this.isCompleta,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descricao': descricao,
      'isCompleta': isCompleta ? 1 : 0,
    };
  }

  factory MetasDto.fromMap(Map<String, dynamic> map) {
    return MetasDto(
      id: map['id'],
      descricao: map['descricao'],
      isCompleta: map['isCompleta'] == 1,
    );
  }
}
