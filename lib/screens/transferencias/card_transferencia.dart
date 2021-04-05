
import 'package:flutter/material.dart';
import 'package:fsi_bank/models/transferencia.dart';

class CardTransferencia extends StatelessWidget {
  final Transferencia _transferencia;
  CardTransferencia(this._transferencia);
  @override
  Widget build(BuildContext context) {
    return  Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.conta.toString()),
      ),
    );
  }
}
