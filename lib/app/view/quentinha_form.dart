import 'package:flutter/material.dart';
import 'package:quentinha_crud/app/view/quentinha_form_back.dart';

class QuentinhaForm extends StatelessWidget {
  Widget fieldSabor(QuentinhaFormBack back){
    return TextFormField(
      initialValue: back.quentinha.sabor,
      decoration: InputDecoration(
        labelText: 'Sabor',
        hintText: 'Strogonoff'
      )
    );
  }

  Widget fieldPreco(QuentinhaFormBack back){
    var  mask = MaskTextInputFormatter(mask: '##,##');
      return TextFormField(
        initialValue: back.quentinha.preco,
        inputFormatters: [mask],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Preço',
          hintText: '99,99'
        )
      );
    }
    Widget fieldTamanho(QuentinhaFormBack back){
      return TextFormField(
        initialValue: back.quentinha.tamanho,
        decoration: InputDecoration(
          labelText: 'Tamanho',
          hintText: 'P/M'
        )
      );
    }
    Widget fieldImgQuentinha(QuentinhaFormBack back){
      return TextFormField(
        initialValue: back.quentinha.imgQuentinha,
        decoration: InputDecoration(
          labelText: 'Imagem Quentinha',
          hintText: 'http://www.site.com'
        )
      );
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Quentinha'),
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed:null)
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          child: Column(
            children: [
              fieldSabor(_back),
              fieldPreco(_back),
              fieldTamanho(_back),
              fieldImgQuentinha(_back)
            ],
            ),
        ),
      ),
    );
  }
}