import 'package:dartz/dartz.dart';
import 'package:todo/core/error/failur.dart';
import 'package:todo/features/todo/domain/entities/todo_enti.dart';
import 'package:todo/features/todo/domain/repositories/todo_repo.dart';

class InsertTodoUsecase {
  final TodoRepo todoRepo ;
  InsertTodoUsecase({required this.todoRepo}); 
  Future<Either<Failur , Unit>> call (TodoEnti todoEnti) {
    return todoRepo.insertTodo(todoEnti) ;
  }
}