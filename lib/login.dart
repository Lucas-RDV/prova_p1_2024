import 'package:flutter/material.dart';
import 'package:novo_projeto/autenticacao/sharedSessao.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  bool _isLoginValid(String login) {
    if (login.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  bool _isSenhaValid(String senha) {
    if (senha.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var usuarioController = TextEditingController();
    var senhaController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(hintText: "Entre com o login"),
            controller: usuarioController,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(hintText: "Entre com a senha"),
            controller: senhaController,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton.icon(
              onPressed: () {
                if (_isLoginValid(usuarioController.text) &&
                    _isSenhaValid(senhaController.text)) {
                  Navigator.pushNamed(context, '/listagem');
                      senhaController.text = "";
                      usuarioController.text = "";
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Usuario ou senha incorretos!')),
                  );
                }
              },
              icon: Icon(Icons.login),
              label: Text('Entrar'),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                if (_isLoginValid(usuarioController.text) &&
                    _isSenhaValid(senhaController.text)) {
                      await SharedSessao.salvarToken(usuarioController.text);
                      Navigator.pushNamed(context, '/listagem');
                      senhaController.text = "";
                      usuarioController.text = "";
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Usuario ou senha incorretos!')),
                  );
                }
              },
              icon: Icon(Icons.add_circle_outline_sharp),
              label: Text('Cadastar'),
            )
          ])
        ],
      ),
    );
  }
}
