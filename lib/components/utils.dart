import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

snackBar(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text('Transferência em processamento.'),
  ));
}

delay(int duration) async {
  await Future.delayed(Duration(seconds: duration));
}

Future<T> navPush<T extends Object>(BuildContext context, Widget page){
   return Navigator.push(context, MaterialPageRoute(builder: (_) {
    return page;
  }));
}