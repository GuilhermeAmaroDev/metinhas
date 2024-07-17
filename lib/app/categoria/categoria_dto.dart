
class CategoriaDto {
  final int? id;
  final String nome;
  final String? icon;

  CategoriaDto({this.id, required this.nome, this.icon});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'icon': icon,
    };
  }

  static CategoriaDto fromMap(Map<String, dynamic> map) {
    return CategoriaDto(
      id: map['id'],
      nome: map['nome'],
      icon: map['icon'],
    );
  }
}
