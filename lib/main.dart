import 'package:alugadrone_app/screens/cadastro_screen.dart';
import 'package:alugadrone_app/screens/home_screen.dart';
import 'package:alugadrone_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/user_model.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));
  Firestore.instance.collection("NewTest").document("teste").setData({"Teste":"Teste"});
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
        model: UserModel(),
        child: MaterialApp(
          title: 'AlugaDrone',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          debugShowCheckedModeBanner: false,
          home: CadastroScreen(),
        )
      );
  }
}
