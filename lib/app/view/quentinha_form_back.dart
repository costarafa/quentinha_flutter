import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:quentinha_crud/app/domain/entities/quentinha.dart';
import 'package:quentinha_crud/app/domain/services/quentinha_service.dart';

class QuentinhaFormBack{
  Quentinha quentinha;
  var _service = GetIt.I.get<QuentinhaService>();
  bool _saborIsValid;
  bool _precoIsValid;
  bool _tamanhoIsValid;

  bool get isValid => _saborIsValid && _precoIsValid && _tamanhoIsValid;

  //diferenciar alterar e criar
  QuentinhaFormBack(BuildContext context){
    var parameter = ModalRoute.of(context).settings.arguments;
    quentinha = (parameter == null)? Quentinha(): parameter;
  }
  //salvar
  save() async{
    await _service.save(quentinha);
  }

  //validações
  String validateSabor(String sabor){
      try{
        _service.validateSabor(sabor);
        _saborIsValid = true;
        return null;
      }catch (e){
        _saborIsValid = false;
        return e.toString();
      }
  }
  
  String validatePreco(String preco){
      try{
        _service.validatePreco(preco);
        _precoIsValid = true;
        return null;
      }catch (e) {
          _precoIsValid = false;
        return e.toString();
      }
  }

  String validateTamanho(String tamanho){
      try{
        _service.validateTamanho(tamanho);
        _tamanhoIsValid = true;
        return null;
      } catch (e) {
        _tamanhoIsValid = false;
        return e.toString();
      }
  }
}