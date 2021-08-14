
import 'package:flutter/material.dart';
import 'package:quentinha_crud/app/domain/entities/quentinha.dart';
import 'package:quentinha_crud/app/view/quentinha_details_back.dart';

class QuentinhaDetails extends StatelessWidget {
  showModalError(BuildContext context){
    var alert = AlertDialog( 
      title: Text('Alerta!'),
      content: Text('O APP solicitado não é compatível!'),
    );
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return alert;
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = QuentinhaDetailsBack(context);
    Quentinha quentinha = _back.quentinha;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
        var width = constraints.biggest.width;
        var radius = width/3;
        //var height = constraints.biggest.height;

        return Scaffold(
          body: ListView(
            padding: EdgeInsets.all(60),
            children: [
              (Uri.tryParse(quentinha.imgQuentinha).isAbsolute) ?
                CircleAvatar(
                  backgroundImage: NetworkImage(quentinha.imgQuentinha),
                  radius: radius,
                ) :
                CircleAvatar(
                  child: Icon(
                    Icons.local_dining,
                    size: width/2,
                  ),
                  radius: radius,
                ),
              Center(
                child: 
                  Text('${quentinha.sabor}', style: TextStyle(fontSize: 30),
                  )
              ),
              Card(
                child: ListTile(
                  title: Text('Preço'),
                  subtitle: Text('${quentinha.preco}'),
                  trailing: Container(
                    width: width/4,
                    child: Row(
                      children: [
                        IconButton(
                          color: Colors.blue,
                          icon: Icon(Icons.message),
                          onPressed: (){
                            _back.launchSabor(showModalError);
                          }
                        ),
                        IconButton(
                          color: Colors.blue,
                          onPressed: (){
                            _back.launchPreco(showModalError);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Tamanho'),
                  onTap: (){
                    _back.launchTamanho(showModalError);
                  },
                  subtitle: Text('${quentinha.tamanho}'),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: (){
              _back.goToBack();
            },
            ),
        );
      },
      
    );
  }
}