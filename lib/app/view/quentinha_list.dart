
import 'package:flutter/material.dart';
import 'package:quentinha_crud/app/database/sqlite/dao/quentinha_dao_impl.dart';
import 'package:quentinha_crud/app/domain/entities/quentinha.dart';

import '../my_app.dart';

class QuentinhaList  extends StatelessWidget {

  Future<List<Quentinha>> _buscar() async{
      return QuentinhaDAOImpl().find();
    }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _buscar(),
      builder: (context, futuro){
        if(futuro.hasData){
          List<Quentinha> lista = futuro.data;
          return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Quentinhas'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
             onPressed: (){
               Navigator.of(context).pushNamed(MyApp.QUENTINHA_FORM);
             }
             )
        ],
      ),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, i){
          var quentinha = lista[i];
          var imgQuentinha = CircleAvatar( backgroundImage: NetworkImage(quentinha.imgQuentinha),);
          return ListTile(
            leading: imgQuentinha,
            title: Text(quentinha.sabor),
            subtitle:  Text(quentinha.preco.toString()),
            trailing: Container(
              width: 100,
              child: Row(
                children: [
                  IconButton(icon: Icon(Icons.edit), onPressed: null),
                  IconButton(icon: Icon(Icons.delete), onPressed: null),
                ],
                ),
              ) ,
          );
        },
      )
      );

        }else{
          return Scaffold();
        }
      }
      );
    
  }
}