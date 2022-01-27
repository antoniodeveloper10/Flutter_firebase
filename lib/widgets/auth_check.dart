import 'package:agoravai/pages/BoasVindas.dart';
import 'package:agoravai/pages/login_page.dart';
import 'package:agoravai/services/AuthService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AutCheck extends StatefulWidget {
  AutCheck({Key? key}) : super(key: key);

  @override
  _AutCheckState createState() => _AutCheckState();
}

class _AutCheckState extends State<AutCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);
    if (auth.isLoading)
      return loading();
    else if (auth.usuario == null)
      return LoginPage();
    else
      return BoasVindas();
  }
}

loading() {
  return Scaffold(
    body: Center(
      child: CircularProgressIndicator(),
    ),
  );
}
