import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:quentinha_crud/app/domain/entities/quentinha.dart';
import 'package:quentinha_crud/app/domain/services/quentinha_service.dart';

import '../my_app.dart';

part 'quentinha_list_back.g.dart';

class QuentinhaListBack = _QuentinhaListBack with _$QuentinhaListBack;

abstract class _QuentinhaListBack with Store{
var _service = GetIt.I.get<QuentinhaService>();
//lista de quentinhas 
@observable
Future<List<Quentinha>> list;

//atualizar a lista de contatos
@action
refreshList([dynamic value]){
  list = _service.find();
}

_QuentinhaListBack(){
  refreshList();
}

//chamar o form para salvar e alterar
goToForm(BuildContext context, [Quentinha quentinha]){
  Navigator.of(context).pushNamed(MyApp.QUENTINHA_FORM, arguments: quentinha).then(refreshList);
} 

goToDetails(BuildContext context, Quentinha quentinha){
  Navigator.of(context).pushNamed(MyApp.QUENTINHA_DETAILS, arguments: quentinha);

}
//excluir
remove(int id){
  _service.remove(id);
  refreshList();
}

}