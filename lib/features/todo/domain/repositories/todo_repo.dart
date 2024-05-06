import 'package:dartz/dartz.dart';
import 'package:todo/core/error/failur.dart';
import 'package:todo/features/todo/domain/entities/todo_enti.dart';

abstract class TodoRepo {
  Future<Either<Failur , List<TodoEnti>>> getDoneTodo() ;  
  Future<Either<Failur , List<TodoEnti>>> getNotDoneTodo() ;  
  Future<Either<Failur , Unit>> insertTodo(TodoEnti todoEnti) ;  
  Future<Either<Failur , Unit>> updateTodo(int idTodo) ;  
}