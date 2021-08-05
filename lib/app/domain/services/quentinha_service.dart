import 'package:quentinha_crud/app/domain/entities/quentinha.dart';
import 'package:quentinha_crud/app/domain/exception/domain_layer_exception.dart';
import 'package:quentinha_crud/app/domain/interfaces/quentinha_dao.dart';
import 'package:get_it/get_it.dart';

class QuentinhaService{
 var _dao = GetIt.I.get<QuentinhaDAO>();


save(Quentinha quentinha){
  validateSabor(quentinha.sabor);
  validatePreco(quentinha.preco.toString());
  validateTamanho(quentinha.tamanho);
  _dao.save(quentinha);
}
  remove(int id){
    _dao.remove(id);
  }

  Future<List<Quentinha>>find(){
    return _dao.find();
  }

  //sabor precisa ser obrigatório e ter no mínimo 3 caracteres e maximo 30
  validateSabor(String sabor){
    var min = 3;
    var max = 30;

    if(sabor == null){
      throw new DomainLayerException('O sabor é obrigatório.');
    }else if(sabor.length < min){
      throw new DomainLayerException('O sabor deve possuir pelo menos $min caracteres.');
    }else if(sabor.length > max){
      throw new DomainLayerException('O sabor deve possuir no máximo $max caracteres.');
    }
  }

  //preco precisa ser obrigatório
  validatePreco(String preco){
    if(preco == null){
      throw new DomainLayerException('O preço é obrigatório.');
    }
  }

  validateTamanho(String tamanho){
    String tamanhoPadrao = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(tamanhoPadrao);
    if(tamanho == null){
      throw new DomainLayerException('O tamanho é obrigatório.');
    }else if(tamanho !='P' || tamanho != 'M'){
      throw new DomainLayerException('Os tamanhos devem ser P ou M');
    }else if(!regExp.hasMatch(tamanho)){
      throw new DomainLayerException('O tamanho não aceita números');
    }
  }

  //
}