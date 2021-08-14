import 'package:flutter/material.dart';
import 'package:quentinha_crud/app/domain/entities/quentinha.dart';
import 'package:quentinha_crud/app/view/quentinha_list_back.dart';

class QuentinhaList  extends StatelessWidget {
  final _back = QuentinhaListBack();

  CircleAvatar circleAvatar(String imgQuentinha){
    return (Uri.tryParse("").isAbsolute) ?
      CircleAvatar(backgroundImage: NetworkImage(imgQuentinha))
      : CircleAvatar(child: Icon(Icons.local_dining));
  }

  Widget iconEditButton(Function onPressed){
    return IconButton(
      icon: Icon(Icons.edit),
      color: Colors.black,
      onPressed: onPressed
    );
  }
  Widget iconRemoveButton(BuildContext context, Function remove){
    return IconButton(
      icon: Icon(Icons.delete),
      color: Colors.blue,
      onPressed: (){
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Excluir'),
            content: Text('Confirma a exclusão?'),
            actions: [
              FlatButton(
                child: Text('Não'),
                onPressed:(){
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Sim'),
                onPressed: remove,
              ),
            ], 
          )
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Quentinhas'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
             onPressed: (){
               _back.goToForm(context);
             }
             )
        ],
      ),
      body: FutureBuilder(
      future: _back.list,
      builder: (context, futuro){
        if(!futuro.hasData){
          return CircularProgressIndicator();
        } else{
          List<Quentinha> lista = futuro.data;
          return ListView.builder(
            itemCount: lista.length,
            itemBuilder: (context, i){
             var quentinha = lista[i];
             return ListTile(
              leading: circleAvatar(quentinha.imgQuentinha),
              title: Text(quentinha.sabor),
              onTap: (){
                _back.goToDetails(context,quentinha);

            },
            subtitle:  Text(quentinha.preco.toString()),
            trailing: Container(
              width: 100,
              child: Row(
                children: [
                  iconEditButton((){
                    _back.goToForm(context, quentinha);
                  }),
                  iconRemoveButton(context, (){
                    _back.remove(quentinha.id);
                    Navigator.of(context).pop();
                  })
                ],
                ),
              ) ,
          );
        },
      );
    }
   }));
    
  }
}