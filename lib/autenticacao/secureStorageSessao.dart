import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageSessao {
  static final storage = FlutterSecureStorage();

  static Future<void> salvarToken(String token) async { //salvar token de autenticação
    await storage.write(key: 'auth_token', value: token);
  }

  static Future<String?> carregarToken() async { //buscar o token de autenticação
    return await storage.read(key: 'auth_token');
  }

  static Future<bool> estaLogado() async { //testa se o usuario esta logado
      final token = await carregarToken();
      return token != null;
  }

  static Future<void> removerToken() async { //logout
    await storage.delete(key: 'auth_token');
  }

  static Future<void> limparTudo() async { //deleta tudo que esta armazenado
    await storage.deleteAll();
  }
}