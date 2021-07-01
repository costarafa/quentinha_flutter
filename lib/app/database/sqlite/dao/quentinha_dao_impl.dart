import 'package:quentinha_crud/app/domain/entities/quentinha.dart';
import 'package:quentinha_crud/app/domain/interfaces/quentinha_dao.dart';
import 'package:sqflite/sqflite.dart';

import '../connection.dart';

class QuentinhaDAOImpl implements QuentinhaDAO{
  Database _db;

  @override
  Future<List<Quentinha>> find() async {
    _db = await  Connection.get();
    List<Map<String,dynamic>> resultado =  await _db.query('quentinha');
    List<Quentinha> lista = List.generate( resultado.length, (i){
      var linha = resultado[i];
      return Quentinha(
        id : linha['id'],
        sabor: linha['sabor'],
        preco: linha['preco'],
        tamanho: linha['tamanho'],
        imgQuentinha:  linha['img_quentinha']
      );
    }
    );

    return lista;
  }

  @override
  remove(int id) async {
    _db = await  Connection.get();
    var sql ='DELETE FROM quentinha WHERE id = ?';
    _db.rawDelete(sql, [id]);
    }
  
    @override
  save(Quentinha quentinha) async {
    _db = await  Connection.get();
    var sql;
    if(quentinha.id == null){
      sql = 'INSERT INTO quentinha (sabor, preco, tamanho, img_quentinha) VALUES (?,?,?,?)';
      _db.rawInsert(sql,[quentinha.sabor,quentinha.preco,quentinha.tamanho,quentinha.imgQuentinha]);
    }else{
      sql = 'UPDATE quentinha SET sabor = ?, preco =?, tamanho = ?, img_quentinha= ? WHERE id = ?';
      _db.rawUpdate(sql,[quentinha.sabor, quentinha.preco, quentinha.tamanho, quentinha.imgQuentinha, quentinha.id]);
    }
  }

}