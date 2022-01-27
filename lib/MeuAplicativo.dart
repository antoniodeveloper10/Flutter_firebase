import 'package:agoravai/pages/BoasVindas.dart';
import 'package:agoravai/pages/login_page.dart';
import 'package:agoravai/widgets/auth_check.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cripto Moedas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: AutCheck(),
    );
  }
}
