import 'package:novo_projeto/autenticacao/sharedSessao.dart';
import 'package:novo_projeto/entidade/usuario.dart';
import 'package:novo_projeto/repositorio/Dao.dart';
import 'package:novo_projeto/repositorio/DaoSqLite.dart';

class Logincontroler {
  final DaoSqLite _dao = DaoSqLite();

  Future<int> salvar(String nome, String senha) {
    Usuario login = Usuario(nome: nome, senha: senha);
    return _dao.addUser(login);
  }

  Future<bool> login(String nome, String senha) async {
    Future<bool> retorno = _dao.login(nome, senha);
    if (await retorno) {
      SharedSessao.salvarToken(nome);
      return true;
    } else {
      return false;
    }
  }

  void logout() async {
    SharedSessao.logout();
  }
}