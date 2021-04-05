import 'package:fsi_bank/database/database.dart';
import 'package:fsi_bank/models/transferencia.dart';

class TransferenciaDao {
  findAll() async {
    List<Map<String, dynamic>> maps = await DataBase.findAll('transferencias');
    return List.generate(maps.length, (index) {
      return Transferencia(
        maps[index]['valor'],
        maps[index]['conta'],
        id: maps[index]['id'],
      );
    });
  }

  Future<int> save(Transferencia transferencia){
    return DataBase.save(transferencia, 'transferencias');
  }

}
