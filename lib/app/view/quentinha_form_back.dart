import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:quentinha_crud/app/domain/entities/quentinha.dart';
import 'package:quentinha_crud/app/domain/services/quentinha_service.dart';
import 'package:quentinha_crud/app/domain/services/quentinha_service.dart';

part 'quentinha_form_back.g.dart';

class QuentinhaFormBack = _QuentinhaFormBack with _$QuentinhaFormBack;

abstract class _QuentinhaFormBack with Store{
  Quentinha quentinha;
  var _service = GetIt.I.get<ContactService>();
  bool _saborIsValid;
  bool _precoIsValid;
  bool _tamanhoIsValid;

bool get isValid => _saborIsValid && _precoIsValid && _tamanhoIsValid;

//diferenciar alterar e criar
_QuentinhaFormBack(BuildContext context){
  var parameter = ModalRoute.of(context).settings.arguments;
  quentinha = (parameter == null)? Quentinha(): parameter;
}
//salvar
save()async{
  await _service.save(quentinha);
}
//validações
String validateSabor(String sabor);
try{
  _service.validateSabor(sabor);
  _saborIsValid = true;
  return null;
} catch (e) {
  _saborIsValid = false;
  return e;
}
String validatePreco(String preco);
try{
  _service.validatePreco(preco);
    precoIsValid = true;
  return null;
} catch (e) {
  _precoIsValid = false;
  return e;
}


}