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

class UpdateTodoEvent extends TodoEvent {
  final List<int> idsTodo;
  const UpdateTodoEvent({required this.idsTodo});
  @override
  List<Object> get props => [idsTodo];
}