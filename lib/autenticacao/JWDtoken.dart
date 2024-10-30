import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class JWDtoken {
  static const _secret = 'ababa';

  //criar o JWD
  static String criarToken(String nome, String senha) {
    final jwt = JWT(
      {
        'name': nome,
        'password': senha
    },
    );
    return jwt.sign(SecretKey(_secret), algorithm: JWTAlgorithm.HS256);
  }

  
}