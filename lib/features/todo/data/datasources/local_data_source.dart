import 'package:dartz/dartz.dart';
import 'package:todo/core/database/todo_data_base.dart';
import 'package:todo/core/error/expetion.dart';
import 'package:todo/features/todo/data/models/todo_model.dart';

abstract class LocalDataSource {
  Future<List<TodoModel>> getDoneTodo();
  Future<List<TodoModel>> getNotDoneTodo();
  Future<Unit> insertTodo(TodoModel todoModel);
  Future<Unit> updateTodo(int idTodo);
}

class LocalDataSourceImp implements LocalDataSource {
  final TodoDataBase todoDataBase;

  LocalDataSourceImp({required this.todoDataBase});
  @override
  Future<Unit> updateTodo(int idTodo) async {
    int status = await todoDataBase.updateTodo(idTodo) ;
    if (status == 1) {
      return Future.value(unit) ;
    } else {
      throw  SqlException() ;
    }
  }

  @override
  Future<List<TodoModel>> getDoneTodo() async {
    try { 
      List data = await todoDataBase.getDoneTodo() ;
      List<TodoModel> dataToModel = data.map<TodoModel>((e) => TodoModel.fromJson(e)).toList() ;
      return dataToModel ;
    } catch (e) {
      throw EmpityException() ;
    }    
      
   
  }

  @override
  Future<List<TodoModel>> getNotDoneTodo() async{
    try { 
      List data = await todoDataBase.getNotDoneTodo() ;
      List<TodoModel> dataToModel = data.map<TodoModel>((e) => TodoModel.fromJson(e)).toList() ;
      return dataToModel ;
    } catch (e) {
      throw EmpityException() ;
    }    
  }

  @override
  Future<Unit> insertTodo(TodoModel todoModel) async{
    int status = await todoDataBase.insertTodo(todoModel) ;
    if (status == 1) {
      return Future.value(unit); 
    } else {
      throw SqlException() ;
    }
  }
}
