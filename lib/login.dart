import 'package:flutter/material.dart';
import 'package:novo_projeto/autenticacao/sharedSessao.dart';
import 'package:novo_projeto/controle/loginControler.dart';

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
              onPressed: () async {
                Logincontroler u = Logincontroler();
                try {
                  bool success = await u.login(usuarioController.text, senhaController.text);
                  if (success) {
                    Navigator.pushNamed(context, '/listagem');
                  } else {
                    _showDialog(context,"login ou senha invalidos", "erro");
                  }
                } catch(e) {
                  _showDialog(context, "erro ao realizar login", "erro");
                }
              },
              icon: Icon(Icons.login),
              label: Text('Entrar'),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                if (usuarioController.text.isNotEmpty) {
                  if (senhaController.text.isNotEmpty) {
                    Logincontroler u = Logincontroler();
                    try {
                     await  u.salvar(usuarioController.text, senhaController.text);
                     _showDialog(context, "usuario cadastrado com sucesso!", "sucesso");
                    } catch(e) {
                      _showDialog(context, e.toString(), "erro");
                    }
                  } else {
                    _showDialog(context, "Senha não pode ser vazio!", "erro");
                  }
                } else {
                  _showDialog(context, "Usuario não pode ser vazio!", "erro");
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

  void _showDialog(BuildContext context, String message, String title) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              }, 
            child: Text('ok'))
          ]
        );
      }
      );
  }
}
