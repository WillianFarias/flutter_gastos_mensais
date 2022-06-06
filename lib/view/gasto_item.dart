import 'package:flutter/material.dart';
import 'package:gastos_mensais/model/gasto_mensal.dart';
import 'package:gastos_mensais/view/cadastro_gasto_mensal.dart';
import 'lista_gasto_mensal.dart';
import 'package:gastos_mensais/controller/gasto_controller.dart';

class GastoItem extends StatefulWidget {
  List<GastoMensal> _listaGastosMensal;
  int _index;
  GastoMensal _gastoMensal;
  GastoItem(this._gastoMensal, this._index, this._listaGastosMensal);
  @override
  _GastoItemState createState() => _GastoItemState();
}

class _GastoItemState extends State<GastoItem> {
  GastoMensal? _ultimoRemovido;
  GastoController _gastoController = GastoController();

  _atualizarLista() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListaGastoMensal(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: const Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: Card(
        color: Colors.amber,
        child: ListTile(
          title: Text(
            widget._gastoMensal.finalidade,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          subtitle: Text(
            widget._gastoMensal.valor.toStringAsFixed(2),
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Cadastro(
                  gastoMensal: widget._listaGastosMensal[widget._index],
                ),
              ),
            );
          },
        ),
      ),
      onDismissed: (direction) {
        setState(() {
          mostrarAlerta(context);
        });
      },
    );
  }

  mostrarAlerta(BuildContext context) {
    Widget botaoNao = TextButton(
      child: const Text(
        "Não",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        _atualizarLista();
      },
    );
    Widget botaoSim = TextButton(
      child: const Text(
        "Sim",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: () {
        _ultimoRemovido = widget._listaGastosMensal[widget._index];
        widget._listaGastosMensal.removeAt(widget._index);
        _gastoController.excluir(_ultimoRemovido!.id!);
        _atualizarLista();
      },
    );
    AlertDialog alerta = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      backgroundColor: Colors.orange[800],
      title: const Text(
        "Aviso",
        style: TextStyle(color: Colors.black),
      ),
      content: const Text(
        "Deseja apagar o registro?",
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        botaoNao,
        botaoSim,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }
}
