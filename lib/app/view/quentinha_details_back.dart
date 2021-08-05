import 'package:flutter/cupertino.dart';
import 'package:quentinha_crud/app/domain/entities/quentinha.dart';
import 'package:url_launcher/url_launcher.dart';

class QuentinhaDetailsBack{
  BuildContext context;
  Quentinha quentinha;
  
  QuentinhaDetailsBack(this.context){
    quentinha = ModalRoute.of(context).settings.arguments;
  }
  
  goToBack(){
    Navigator.of(context).pop();
  }

    _launchApp(String url, Function(BuildContext context) showModalError) async{
      await canLaunch(url) ? await launch(url) : showModalError(context);
    }

    launchSabor(Function(BuildContext context) showModalError){
      _launchApp('sabor:${quentinha.sabor}', showModalError);
    }

    launchPreco(Function(BuildContext context) showModalError){
      _launchApp('preco:${quentinha.preco}', showModalError);
    }

    launchTamanho(Function(BuildContext context) showModalError){
      _launchApp('tamanho:${quentinha.tamanho}', showModalError);
    }
}