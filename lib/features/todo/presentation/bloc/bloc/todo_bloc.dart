import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/core/error/failur.dart';
import 'package:todo/features/todo/domain/entities/todo_enti.dart';
import 'package:todo/features/todo/domain/usecases/update_todo_usecase.dart';
import 'package:todo/features/todo/domain/usecases/get_done_todo.dart';
import 'package:todo/features/todo/domain/usecases/get_not_done_todo.dart';
import 'package:todo/features/todo/domain/usecases/insert_todo_usecase.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetDoneTodoUsecase getDoneTodoUsecase;
  final GetNotDoneTodoUsecase getNotDoneTodoUsecase;
  final InsertTodoUsecase insertTodoUsecase;
  final UpdateTodoUsecase updateTodoUsecase;
  TodoBloc(
      {required this.getDoneTodoUsecase,
      required this.getNotDoneTodoUsecase,
      required this.insertTodoUsecase,
      required this.updateTodoUsecase})
      : super(TodoInitial()) {
    on<TodoEvent>((event, emit) {});
    //
    on<GetDoneTodoEvent>((event, emit) async {
      emit(LoadingTodoState());
      var failurOrDone = await getDoneTodoUsecase.call();
      emit(_getData(failurOrDone));
    });
    //
    on<GetNotDoneTodoEvent>((event, emit) async {
      emit(LoadingTodoState());
      var failurOrDone = await getNotDoneTodoUsecase.call();
      emit(_getData(failurOrDone));
    });
    //
    on<AddTodoEvent>((event, emit) async {
      emit(LoadingTodoState());
      var failurOrDone = await insertTodoUsecase.call(event.todoEnti);
      emit(_insertAndDelete(failurOrDone));
      add(GetNotDoneTodoEvent());
    });
    //
    on<UpdateTodoEvent>((event, emit) async {
      emit(LoadingTodoState());

      late Either<Failur, Unit> failurOrDone;
      for (var i = 0; i < event.idsTodo.length; i++) {
        failurOrDone = await updateTodoUsecase.call(event.idsTodo[i]);
      }
      emit(_insertAndDelete(failurOrDone));
      add(GetNotDoneTodoEvent());
    });
  }
  ////////////
  TodoState _getData(Either<Failur, List<TodoEnti>> either) {
    return either.fold((failur) {
      return ErrorTodoState();
    }, (listData) {
      return LoadedTodoState(todoList: listData);
    });
  }

  ///////////
  TodoState _insertAndDelete(Either<Failur, Unit> either) {
    return either.fold((failur) {
      return ErrorTodoState();
    }, (done) {
      return const LoadedTodoState();
    });
  }
}
