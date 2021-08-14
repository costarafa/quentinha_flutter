import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quentinha_crud/app/view/quentinha_form_back.dart';

class QuentinhaForm extends StatelessWidget {
final _form = GlobalKey<FormState>();

  Widget fieldSabor(QuentinhaFormBack back){
    return TextFormField(
      validator: back.validateSabor,
      onSaved:(newValue) => back.quentinha.sabor = newValue,
      initialValue: back.quentinha.sabor,
      decoration: InputDecoration(
        labelText: 'Sabor',
        hintText: 'Strogonoff'
      )
    );
  }

  Widget fieldPreco(QuentinhaFormBack back){
    var mask = MaskTextInputFormatter(mask: '##,##');
    return TextFormField(
      validator: back.validatePreco,
      onSaved: (newValue) => back.quentinha.preco = double.parse(newValue),
      initialValue: back.quentinha.preco.toString(),
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
        validator: back.validateTamanho,
        onSaved:(newValue) => back.quentinha.tamanho = newValue,
        initialValue: back.quentinha.tamanho,
        decoration: InputDecoration(
          labelText: 'Tamanho',
          hintText: 'P/M'
        )
      );
    }
    Widget fieldImgQuentinha(QuentinhaFormBack back){
      return TextFormField(
        onSaved:(newValue) => back.quentinha.imgQuentinha = newValue,
        initialValue: back.quentinha.imgQuentinha,
        decoration: InputDecoration(
          labelText: 'Imagem Quentinha',
          hintText: 'http://www.site.com'
        )
      );
    }
  @override
  Widget build(BuildContext context) {
    var _back = QuentinhaFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Quentinha'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed:(){
              _form.currentState.validate();
              _form.currentState.save();
              if(_back.isValid){
                _back.save();
                Navigator.of(context).pop();
              }
            })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
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