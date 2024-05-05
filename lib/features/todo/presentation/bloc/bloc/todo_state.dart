part of 'todo_bloc.dart';

sealed class TodoState extends Equatable {
  const TodoState();
  
  @override
  List<Object> get props => [];
}

final class TodoInitial extends TodoState {}
final class LoadingTodoState extends TodoState {}
final class LoadedTodoState extends TodoState {
 final List<TodoEnti>? todoList ;

 const LoadedTodoState({this.todoList});
}
final class ErrorTodoState extends TodoState {}
final class BottomBarState extends TodoState {
  final int showNumber ;

 const BottomBarState({required this.showNumber});
  
}