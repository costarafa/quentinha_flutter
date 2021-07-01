import 'package:quentinha_crud/app/database/sqlite/dao/quentinha_dao_impl.dart';
import 'package:quentinha_crud/app/domain/interfaces/quentinha_dao.dart';
import 'package:get_it/get_it.dart';

setupInjection(){
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<QuentinhaDAO>(QuentinhaDAOImpl());
}