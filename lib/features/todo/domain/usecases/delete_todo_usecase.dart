import 'package:dartz/dartz.dart';
import 'package:todo/core/error/failur.dart';
import 'package:todo/features/todo/domain/repositories/todo_repo.dart';

class DeleteTodoUsecase {
  final TodoRepo todoRepo ;
  DeleteTodoUsecase({required this.todoRepo}); 
  Future<Either<Failur,Unit>> call (int idTodo) {
    return todoRepo.deleteTodo(idTodo) ;
  }
}