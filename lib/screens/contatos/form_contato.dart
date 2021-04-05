import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsi_bank/components/elevateButton.dart';
import 'package:fsi_bank/components/text_form_field.dart';
import 'package:fsi_bank/components/utils.dart';
import 'package:fsi_bank/database/dao/contato_dao.dart';
import 'package:fsi_bank/models/contato.dart';

class FormContato extends StatefulWidget {
  @override
  _FormContatoState createState() => _FormContatoState();
}

class _FormContatoState extends State<FormContato> {
  final _formKey = GlobalKey<FormState>();
  var tnome = TextEditingController();
  var tconta = TextEditingController();
  bool valueCircular = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Contatos"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextFormFieldPerson(
              labelText: "Nome Completo",
              inputType: TextInputType.text,
              controller: tnome,
              validator: _validarNome,
            ),
            TextFormFieldPerson(
              labelText: "Conta",
              hintText: "0000",
              inputType: TextInputType.number,
              controller: tconta,
              validator: validarConta,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 40,
                width: 150,
                child: ElevateButtonCustom(
                  onclickButton: onclickButton,
                  valueCircular: valueCircular,
                  descriccao: "Enviar",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _validarNome(String value) {
    if (value == null || value.isEmpty) {
      return "O campo nome é obrigatório!";
    }
    return null;
  }

  String validarConta(String value) {
    if (value == null || value.isEmpty) {
      return "O campo Conta é obrigatório!";
    }
    if (int.tryParse(value) == null) {
      return "Esse campo não está coerente com o esperado!";
    }
    return null;
  }

  void onclickButton() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        valueCircular = true;
      });
      await delay(2);
      final contato = Contato(tnome.text, int.tryParse(tconta.text));
      ContatoDao().save(contato).then((value) {
        Navigator.pop(context);
      });
    }
  }
}
