// ignore_for_file: dead_code, prefer_const_constructors

import 'dart:io';

import 'package:agoravai/services/AuthService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();

  bool isLogin = true;
  late String titulo;
  late String actionButton;
  late String toggleButton;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool acao) {
    setState(() {
      isLogin = acao;
      if (isLogin) {
        titulo = 'Bem vindos';
        actionButton = 'Login';
        toggleButton = 'Cadastre-se';
      } else {
        titulo = 'Crie sua conta';
        actionButton = 'Cadastrar';
        toggleButton = 'Voltar Login';
      }
    });
  }

  void login() async {
    try {
      await context.read<AuthService>().login(email.text, senha.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  void registrar() async {
    try {
      await context.read<AuthService>().registrar(email.text, senha.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 100),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  titulo,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.5,
                  ),
                ),
                _email(),
                _senha(),
                Padding(
                  padding: EdgeInsets.all(24.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (isLogin) {
                          login();
                        } else {
                          registrar();
                        }
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: (false)
                          ? [
                              Padding(
                                padding: EdgeInsets.all(16),
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ]
                          : [
                              Icon(Icons.check),
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  actionButton,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => setFormAction(!isLogin),
                  child: Text(toggleButton),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _senha() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
      child: TextFormField(
        controller: senha,
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Senha',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Informa sua senha!';
          } else if (value.length < 6) {
            return 'Sua senha deve ter no m??nimo 6 caracteres';
          }
          return null;
        },
      ),
    );
  }

  Widget _email() {
    return Padding(
      padding: EdgeInsets.all(24),
      child: TextFormField(
        controller: email,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Email',
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Informe o email corretamente!';
          }
          return null;
        },
      ),
    );
  }
}
