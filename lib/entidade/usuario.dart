class Usuario {
  int? id;
  String nome;
  String senha;

  Usuario({required this.nome,required this.senha,});

  Map<String, dynamic> toMap() {
    var map = {
      'nome': nome,
      'senha': senha,
    };
    return map;
  }

}