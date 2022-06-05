import 'package:flutter/material.dart';
import 'package:gastos_mensais/controller/gasto_controller.dart';
import 'cadastro_gasto_mensal.dart';
import 'package:gastos_mensais/model/gasto_mensal.dart';
import 'gasto_item.dart';

class ListaGastoMensal extends StatefulWidget {
  @override
  _ListaGastoMensalState createState() => _ListaGastoMensalState();
}

class _ListaGastoMensalState extends State<ListaGastoMensal> {
  GastoController _gastoController = GastoController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("\$ Gasto mensal \$"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: FutureBuilder<List<GastoMensal>>(
        initialData: [],
        future: _gastoController.findAll(),
// ignore: missing_return
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text("Carregando..."),
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<GastoMensal> gastos = snapshot.data!;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final GastoMensal gastoMensal = gastos[index];
                  return GastoItem(gastoMensal);
                },
                itemCount: gastos.length,
              );
              break;
          }
          return Text("Erro");
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Cadastro(),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
