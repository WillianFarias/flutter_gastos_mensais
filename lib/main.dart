import 'package:flutter/material.dart';
import 'view/cadastro_gasto_mensal.dart';

void main() {
  runApp(MaterialApp(
    home: Cadastro(),
    theme: ThemeData(
        hintColor: Color.fromARGB(255, 46, 91, 150),
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
          hintStyle: TextStyle(color: Colors.amber),
        )),
  ));
}
