import 'package:flutter/material.dart';
import 'view/cadastro_gasto_mensal.dart';
import 'controller/gasto_controller.dart';
import 'model/gasto_mensal.dart';

// void main() {
//   runApp(MaterialApp(
//     home: Cadastro(),
//     theme: ThemeData(
//         hintColor: Color.fromARGB(255, 46, 91, 150),
//         primaryColor: Colors.white,
//         inputDecorationTheme: InputDecorationTheme(
//           enabledBorder:
//               OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
//           focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Color.fromARGB(255, 46, 91, 150))),
//           hintStyle: TextStyle(color: Colors.amber),
//         )),
//   ));
// }

Future<void> main() async {
/*runApp(MaterialApp(
home: Cadastro(),
theme: ThemeData(
hintColor: Colors.deepOrangeAccent,
primaryColor: Colors.white,
inputDecorationTheme: InputDecorationTheme(
enabledBorder:
OutlineInputBorder(borderSide: BorderSide(color:Colors.white)),
focusedBorder:
OutlineInputBorder(borderSide: BorderSide(color:Colors.amber)),
hintStyle: TextStyle(color: Colors.amber),
)),
));*/
  WidgetsFlutterBinding.ensureInitialized();
  // GastoController gastoController = GastoController();
  // GastoMensal gastoMensal =
  //     GastoMensal(null, 2020, "Setembro", "Contade agua", 50.9, "Fixo");
  // gastoController.salvar(gastoMensal).then((res) => print(res));
  GastoController gastoController = GastoController();
  List<GastoMensal> gastos = await gastoController.findAll();
  print(gastos);
}
