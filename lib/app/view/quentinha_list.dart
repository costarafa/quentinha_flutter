import 'package:quentinha_crud/app/database/script.dart';
import 'package:quentinha_crud/app/database/sqlite/connection.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

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
          var img_quentinha = CircleAvatar( backgroundImage: NetworkImage(quentinha['url_quentinha']),);
          return ListTile(
            leading: img_quentinha,
            title: Text(quentinha['sabor']),
            subtitle:  Text(quentinha['preco']),
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