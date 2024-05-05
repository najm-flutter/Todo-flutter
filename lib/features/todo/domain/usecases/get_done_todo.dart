import 'package:dartz/dartz.dart';
import 'package:todo/core/error/failur.dart';
import 'package:todo/features/todo/domain/entities/todo_enti.dart';
import 'package:todo/features/todo/domain/repositories/todo_repo.dart';

class GetDoneTodoUsecase {
  final TodoRepo todoRepo ;
  GetDoneTodoUsecase({required this.todoRepo});
   Future<Either<Failur , List<TodoEnti>>> call () async {
    return todoRepo.getDoneTodo();
   }
}