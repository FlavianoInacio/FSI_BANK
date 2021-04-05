import 'package:flutter/material.dart';
import 'package:fsi_bank/components/card_item.dart';
import 'package:fsi_bank/components/utils.dart';
import 'package:fsi_bank/database/dao/contato_dao.dart';
import 'package:fsi_bank/models/contato.dart';
import 'package:fsi_bank/screens/contatos/form_contato.dart';

class ListContatos extends StatefulWidget {

  @override
  _ListContatosState createState() => _ListContatosState();
}

class _ListContatosState extends State<ListContatos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        onPressed: _onclick,
        child: Icon(Icons.add),
      ),
    );
  }

  _body()  {
    return FutureBuilder<dynamic>(
        future: ContatoDao().findAll(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          List<Contato> contatos = snapshot.data;
          return ListView.builder(
            itemCount: contatos.length,
            itemBuilder: (context, index) {
              Contato contato = contatos[index];
              return CardItem(
                title: contato.nome,
                subtitle: contato.conta.toString(),
              );
            },
          );
        });
  }

  void _onclick() {
    Future<Contato> future = navPush(context, FormContato());
    future.then((_) {
      setState(() {
      });
    });
  }
}
