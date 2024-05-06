import 'package:dartz/dartz.dart';
import 'package:todo/core/error/expetion.dart';
import 'package:todo/core/error/failur.dart';
import 'package:todo/features/todo/data/datasources/local_data_source.dart';
import 'package:todo/features/todo/data/models/todo_model.dart';
import 'package:todo/features/todo/domain/entities/todo_enti.dart';
import 'package:todo/features/todo/domain/repositories/todo_repo.dart';

class TodoRepoImp implements TodoRepo {
  final LocalDataSource localDataSource;

  TodoRepoImp({required this.localDataSource});
  @override
  Future<Either<Failur, List<TodoEnti>>> getDoneTodo() async {
    try {
      await Future.delayed(const Duration(milliseconds: 1000));
      List<TodoModel> data = await localDataSource.getDoneTodo();
      return right(data);
    } on EmpityException {
      return left(EmpityFailur());
    }
  }

  @override
  Future<Either<Failur, List<TodoEnti>>> getNotDoneTodo() async {
    try {
      await Future.delayed(const Duration(milliseconds: 1000));
      List<TodoModel> data = await localDataSource.getNotDoneTodo();
      return right(data);
    } on EmpityException {
      return left(EmpityFailur());
    }
  }

  @override
  Future<Either<Failur, Unit>> updateTodo(int idTodo) async {
    try {
      await localDataSource.updateTodo(idTodo);
      return right(unit);
    } on SqlException {
      return left(SqlFailur());
    }
  }

  @override
  Future<Either<Failur, Unit>> insertTodo(TodoEnti todoEnti) async {
    try {
      await localDataSource.insertTodo(TodoModel(
          id: todoEnti.id,
          iconId: todoEnti.iconId,
          isDone: todoEnti.isDone,
          title: todoEnti.title,
          description: todoEnti.description,
          time: todoEnti.time));
      return right(unit);
    } on SqlException {
      return left(SqlFailur());
    }
  }
}
