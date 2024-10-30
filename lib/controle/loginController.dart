import 'package:novo_projeto/autenticacao/secureStorageSessao.dart';
import 'package:novo_projeto/repositorio/DaoSqLite.dart';
import 'package:novo_projeto/autenticacao/JWDtoken.dart';

import '../entidade/usuario.dart';

class Logincontroller {
  final DaoSqLite _dao = DaoSqLite();

  Future<int> salvar(String nome, String senha) {
    Usuario login = Usuario(nome: nome, senha: senha);
    return _dao.addUser(login);
  }

  Future<bool> login(String nome, String senha) async {
    Future<bool> retorno = _dao.login(nome, senha);
    if (await retorno) {
      String token = JWDtoken.criarToken(nome, senha);
      await SecureStorageSessao.salvarToken(token);
      return true;
    }
    return false;
  }

  void logout() async {
    SecureStorageSessao.removerToken();
  }
}
