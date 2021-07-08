import 'package:quentinha_crud/app/domain/entities/quentinha.dart';
import 'package:quentinha_crud/app/domain/interfaces/quentinha_dao.dart';
import 'package:get_it/get_it.dart';

class QuentinhaService{
 var dao = GetIt.I.get<QuentinhaDAO>();

  save(){
    dao.save(quentinha);
  }
  remove(int id){
    dao.remove(id);
  }

  Future<List<Quentinha>>find(){
    return dao.find();
  }
}