import 'package:quentinha_crud/app/domain/entities/quentinha.dart';

abstract class QuentinhaDAO{

  save(Quentinha quentinha); 

  remove(int id); 

  Future<List<Quentinha>> find();

}