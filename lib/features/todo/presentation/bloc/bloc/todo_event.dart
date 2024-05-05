part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class AddTodoEvent extends TodoEvent {
  final TodoEnti todoEnti;
  const AddTodoEvent({required this.todoEnti});
  @override
  List<Object> get props => [todoEnti];
}

class GetDoneTodoEvent extends TodoEvent {}

class GetNotDoneTodoEvent extends TodoEvent {}

class DeleteTodoEvent extends TodoEvent {
  final int idTodo;
  const DeleteTodoEvent({required this.idTodo});
  @override
  List<Object> get props => [idTodo];
}