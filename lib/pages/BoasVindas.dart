import 'package:agoravai/services/AuthService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BoasVindas extends StatefulWidget {
  const BoasVindas({Key? key}) : super(key: key);

  @override
  _BoasVindasState createState() => _BoasVindasState();
}

class _BoasVindasState extends State<BoasVindas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quadras'),
        elevation: 6,
        backgroundColor: Colors.green[900],
        leading: Icon(Icons.menu),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              context.read<AuthService>().logout();
            },
          )
        ],
      ),
    );
  }
}
