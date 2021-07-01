import 'package:agenda_crud/app/domain/entities/quentinha.dart';
import 'package:quentinha_crud/app/domain/interfaces/quentinha_dao.dart';
import 'package:get_it/get_it.dart';

class QuentinhaService{
 var dao = GetIt.I.get<QuentinhaDAO>();

 save(){
   _dao.save(quentinha);
 }
 remove(int id){
   _dao.remove(id);
 }

Future<List<Quentinha>>find(){
  return _dao.find();
}
}