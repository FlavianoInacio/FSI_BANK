import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fsi_bank/components/elevateButton.dart';
import 'package:fsi_bank/components/text_form_field.dart';
import 'package:fsi_bank/components/utils.dart';
import 'package:fsi_bank/database/dao/transferencia_dao.dart';
import 'package:fsi_bank/models/transferencia.dart';


class FormTransferencia extends StatefulWidget {
  @override
  _FormTransferenciaState createState() => _FormTransferenciaState();
}

class _FormTransferenciaState extends State<FormTransferencia> {
  final _formKey = GlobalKey<FormState>();
  var tvalor = TextEditingController();
  var tconta = TextEditingController();
  bool _valueCircular = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criação de Transferência"),
      ),
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormFieldPerson(
                    controller: tconta,
                    labelText: "Número da Conta",
                    inputType: TextInputType.number,
                    hintText: "0000",
                    validator: _validatorConta,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormFieldPerson(
                    controller: tvalor,
                    labelText: "Valor",
                    icon: Icons.monetization_on,
                    inputType: TextInputType.number,
                    hintText: "000.00",
                    validator: _validatorValor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                      height: 40.0,
                      width: 188,
                      child: ElevateButtonCustom(
                        onclickButton: _onclickButton,
                        valueCircular: _valueCircular,
                        descriccao: "Confirmar",
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _onclickButton() async {
    if (_formKey.currentState.validate()) {
      snackBar(context);
      setState(() {
        _valueCircular = true;
      });
      Transferencia transferencia = _transferencia();
      await delay(2);
      if(transferencia!=null){
        TransferenciaDao().save(transferencia).then((value) {
          Navigator.pop(context);
        });
      }
      setState(() {
        _valueCircular = false;
      });
    }
  }

  Transferencia _transferencia() {
    double valor = _tryParseDouble(tvalor.text);
    int conta = _tryParseInt(tconta.text);
    if(valor != null && conta != null){
      return Transferencia(valor, conta);
    }
    return null;
  }

  String _validatorConta(String value) {
    if (value == null || value.isEmpty) {
      return "Conta não pode ser vazia!";
    }
    if(_tryParseInt(value)==null){
      return "Valor é incoerente para esse campo!";
    }
    return null;
  }

  String _validatorValor(String value) {
    if (value == null || value.isEmpty) {
      return "Valor não pode ser vazio!";
    }
    if(_tryParseDouble(value)==null){
      return "Valor é incoerente para esse campo!";
    }
    return null;
  }
  double _tryParseDouble(String value){
    return double.tryParse(value);
  }
  int _tryParseInt(String value){
    return int.tryParse(value);
  }
}
