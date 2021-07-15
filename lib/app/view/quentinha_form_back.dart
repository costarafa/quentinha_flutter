import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:quentinha_crud/app/domain/entities/quentinha.dart';

part 'quentinha_form_back.g.dart';

class QuentinhaFormBack = _QuentinhaFormBack with _$QuentinhaFormBack;

abstract class _QuentinhaFormBack with Store{
  Quentinha quentinha;
//diferenciar alterar e criar
_QuentinhaFormBack(BuildContext context){
  var parameter = ModalRoute.of(context).settings.arguments;
  quentinha = (parameter == null)? Quentinha(): parameter;
}
//salvar

//validações
}