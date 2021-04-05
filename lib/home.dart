import 'package:flutter/material.dart';
import 'package:fsi_bank/components/utils.dart';
import 'package:fsi_bank/screens/contatos/list_contatos.dart';
import 'package:fsi_bank/screens/transferencias/list_transferencias.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FSI Bank"),
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        // eixo verticall
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // eixo horizontal
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "https://www.datocms-assets.com/39397/1614171395-open-graph-logo-large-br.png",
          ),
          Row(
            children: [
              _row(
                context,
                "Contatos",
                Icons.people_alt,
                ListContatos(),
              ),
              _row(
                context,
                "Transferências",
                Icons.monetization_on,
                ListTransferencias(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _row(context, String titulo, IconData icon, Widget page) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () {
            _onClickRow(context, page);
          },
          child: Container(
            padding: EdgeInsets.all(8.0),
            width: 150,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                ),
                Text(
                  titulo,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onClickRow(context, page) {
    navPush(context, page);
  }
}
