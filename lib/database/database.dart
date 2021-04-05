import 'dart:async';
import 'package:fsi_bank/models/Entidade.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBase {
  static Future<Database> createTadabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'fsi_bank.db'),
      onCreate: _criarBanco,
      version: 1,
    );
  }
  static Future<void> _criarBanco(Database db, int novaVersao) async {

    List<String> queryes = [
      "CREATE TABLE contatos(id INTEGER PRIMARY KEY, nome TEXT, conta INTEGER);",
      "CREATE TABLE transferencias(id INTEGER PRIMARY KEY, valor REAL, conta INTEGER);",
    ];

    for (String query in queryes) {
      await db.execute(query);
    }
  }

  static Future<int> save(Entidade entidade, String tabela) async {
    final Database db = await createTadabase();
    return db.insert(
      tabela,
      entidade.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  static Future<List<Map<String, dynamic>>> findAll(String tabela) async {
    final Database db = await createTadabase();
    return db.query(tabela);
  }
}
