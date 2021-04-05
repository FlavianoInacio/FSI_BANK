import 'package:fsi_bank/models/Entidade.dart';

class Contato extends Entidade {
  int id;
  String nome;
  int conta;
  
  Contato(this.nome, this.conta,{this.id});

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'conta': conta,
    };
  }
  @override
  String toString() {
    return 'Contatos{id: $id, nome: $nome, conta: $conta}';
  }

}