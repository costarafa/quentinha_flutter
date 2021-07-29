
import 'package:flutter/material.dart';
import 'package:quentinha_crud/app/view/quentinha_details_back.dart';

class QuentinhaDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _back = QuentinhaDetailsBack(context);
    Quentinha quentinha = _back.quentinha;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
        //var width = constraints.biggest.width;
        //var height = constraints.biggest.height;

        return Scaffold(
          body: ListView(
            children: [
              Center(
                child: 
                  Text('${quentinha.sabor}', style: TextStyle(fontSize: 30),
                  )
              ),
              Card(
                child: ListTile(
                  title: Text('Preço'),
                  subtitle: Text('${quentinha.preco}'),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Tamanho'),
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