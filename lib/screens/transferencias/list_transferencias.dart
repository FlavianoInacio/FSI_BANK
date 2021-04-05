import 'package:flutter/material.dart';
import 'package:fsi_bank/components/utils.dart';
import 'package:fsi_bank/database/dao/transferencia_dao.dart';
import 'package:fsi_bank/models/transferencia.dart';
import 'card_transferencia.dart';
import 'form_transferencia.dart';

//ignore: must_be_immutable
class ListTransferencias extends StatefulWidget {
  List<Transferencia> list = List<Transferencia>.empty(growable: true);

  @override
  _ListTransferenciasState createState() => _ListTransferenciasState();
}

class _ListTransferenciasState extends State<ListTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferências"),
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Future<Transferencia> future = navPush(context, FormTransferencia());
          future.then((_) {
            setState(() {
            });
          });
        },
      ),
    );
  }

  _body() {
    return FutureBuilder(
        future: TransferenciaDao().findAll(),
        builder: (context, snapshot) {
          List<Transferencia> transferencias = snapshot.data;
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
              itemCount: transferencias.length,
              itemBuilder: (context, index) {
                return CardTransferencia(Transferencia(
                  transferencias[index].valor,
                  transferencias[index].conta,
                  id: transferencias[index].id,
                ));
              });
        });
  }
}
