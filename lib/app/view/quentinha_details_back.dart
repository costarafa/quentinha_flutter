
import 'package:flutter/cupertino.dart';
import 'package:quentinha_crud/app/domain/entities/quentinha.dart';

class QuentinhaDetailsBack{
  BuildContext context;
  Quentinha quentinha;
  
  QuentinhaDetailsBack(this.context){
    quentinha = ModalRoute.of(context).settings.arguments;
  }
  
  goToBack(){
    Navigator.of(context).pop();

  }
}