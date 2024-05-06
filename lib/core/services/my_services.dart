
import 'package:get_it/get_it.dart';
import 'package:todo/core/database/todo_data_base.dart';
import 'package:todo/features/todo/data/datasources/local_data_source.dart';
import 'package:todo/features/todo/data/repositories/todo_repo_imp.dart';
import 'package:todo/features/todo/domain/repositories/todo_repo.dart';
import 'package:todo/features/todo/domain/usecases/update_todo_usecase.dart';
import 'package:todo/features/todo/domain/usecases/get_done_todo.dart';
import 'package:todo/features/todo/domain/usecases/get_not_done_todo.dart';
import 'package:todo/features/todo/domain/usecases/insert_todo_usecase.dart';
import 'package:todo/features/todo/presentation/bloc/bloc/todo_bloc.dart';

GetIt ls = GetIt.instance;

void init() {
  //features

  //! Bloc
  ls.registerFactory(() => TodoBloc(
      getDoneTodoUsecase: ls(), getNotDoneTodoUsecase: ls(), insertTodoUsecase: ls(), updateTodoUsecase: ls()));
  //!Usecases
  ls.registerLazySingleton(() => GetDoneTodoUsecase(todoRepo: ls()));
  ls.registerLazySingleton(() => GetNotDoneTodoUsecase(todoRepo: ls()));
  ls.registerLazySingleton(() => InsertTodoUsecase(todoRepo: ls()));
  ls.registerLazySingleton(() => UpdateTodoUsecase(todoRepo: ls()));
  //!REPO
  ls.registerLazySingleton<TodoRepo>(() => TodoRepoImp(localDataSource: ls()));
  //!data Sorce
  ls.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImp(todoDataBase: ls()));
  //!core
  ls.registerLazySingleton(() => TodoDataBase());
}
