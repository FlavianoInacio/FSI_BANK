import 'package:fsi_bank/models/Entidade.dart';

class Transferencia extends Entidade {
  int id;
  double valor;
  int conta;

  Transferencia(this.valor, this.conta, {this.id});

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'valor': valor,
      'conta': conta,
    };
  }

  @override
  List<Entidade> mapFromEntidade(List<Map<String, dynamic>> maps) {
    // TODO: implement mapFromEntidade
    throw UnimplementedError();
  }
}
