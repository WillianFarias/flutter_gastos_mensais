import 'dart:io';
import 'package:gastos_mensais/model/gasto_mensal.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class GastoMensalDao {
//Definição dos campos da tabela
  static final _databaseName = "gasto.db";
  static final _databaseVersion = 1;
  static final table = "gastomensal";
  static final _id = "_id";
  static final _ano = "ano";
  static final _mes = "mes";
  static final _finalidade = "finalidade";
  static final _valor = "valor";
  static final _tipoGasto = "tipo_gasto";
// torna esta classe singleton
  GastoMensalDao._privateConstructor();
  static final GastoMensalDao instance = GastoMensalDao._privateConstructor();
// tem somente uma referência ao banco de dados
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
// instancia o db na primeira vez que for acessado
    _database = await _initDatabase();
    return _database!;
  }

// abre o banco de dados ou cria, se ele não existir
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

// Código SQL para criar o banco de dados e a tabela
  Future _onCreate(Database db, int version) async {
    await db.execute("""
      CREATE TABLE $table (
      $_id INTEGER PRIMARY KEY,
      $_ano INTEGER NOT NULL,
      $_mes TEXT NOT NULL,
      $_finalidade TEXT NOT NULL,
      $_valor REAL NOT NULL,
      $_tipoGasto TEXT NOT NULL
      )
    """);
  }

  //Metodo insercao
  static Future<int> inserir(GastoMensal gastoMensal) async {
    var result = 0;
    try {
      Database db = await instance.database;
      result = await db.insert(table, Map.from(gastoMensal.getGastoMensal()));
    } on Exception catch (e) {
      return 0;
    }
    return result;
  }
}
