import 'package:fsi_bank/database/database.dart';
import 'package:fsi_bank/models/contato.dart';

class ContatoDao{

  findAll() async{
    List<Map<String, dynamic>> maps = await DataBase.findAll("contatos");
    return List.generate(maps.length, (index) {
      return Contato(
        maps[index]['nome'],
        maps[index]['conta'],
        id: maps[index]['id'],
      );
    });
  }
   Future<int> save(Contato contato){
    return DataBase.save(contato, 'contatos');
  }

}