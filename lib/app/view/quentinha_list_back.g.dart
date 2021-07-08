// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quentinha_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QuentinhaListBack on _QuentinhaListBack, Store {
  final _$listAtom = Atom(name: '_QuentinhaListBack.list');

  @override
  Future<List<Quentinha>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<Quentinha>> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_QuentinhaListBackActionController =
      ActionController(name: '_QuentinhaListBack');

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_QuentinhaListBackActionController.startAction(
        name: '_QuentinhaListBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_QuentinhaListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
