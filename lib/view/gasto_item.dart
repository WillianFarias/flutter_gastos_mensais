import 'package:flutter/material.dart';
import 'package:gastos_mensais/model/gasto_mensal.dart';

class GastoItem extends StatefulWidget {
  GastoMensal _gastoMensal;
  GastoItem(this._gastoMensal);
  @override
  _GastoItemState createState() => _GastoItemState();
}

class _GastoItemState extends State<GastoItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
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
      ),
    );
  }
}
