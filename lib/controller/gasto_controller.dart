import 'package:gastos_mensais/model/gasto_mensal.dart';
import 'package:gastos_mensais/persistence/gasto_mensal_dao.dart';

class GastoController {
  Future<String> salvar(GastoMensal gastoMensal) async {
    int res = 0;
    try {
      gastoMensal.id != null;
      res = await GastoMensalDao.alterar(gastoMensal);
    } catch (e) {
      res = await GastoMensalDao.inserir(gastoMensal);
    }
    if (res == 0) {
      return "Erro ao salvar registro";
    } else {
      return "Salvo com sucesso.";
    }
  }

  //Recupera os valores do bd
  Future<List<GastoMensal>> findAll() async {
    List<GastoMensal> gastos = await GastoMensalDao.findAll();
    return gastos;
  }
}
