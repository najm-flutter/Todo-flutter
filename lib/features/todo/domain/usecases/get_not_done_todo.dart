import 'package:dartz/dartz.dart';
import 'package:todo/core/error/failur.dart';
import 'package:todo/features/todo/domain/entities/todo_enti.dart';
import 'package:todo/features/todo/domain/repositories/todo_repo.dart';

class GetNotDoneTodoUsecase {
  final TodoRepo todoRepo ;
  GetNotDoneTodoUsecase({required this.todoRepo}); 
  Future<Either<Failur , List<TodoEnti>>> call () {
    return todoRepo.getNotDoneTodo() ;
  }
}