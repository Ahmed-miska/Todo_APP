part of 'add_todo_cubit.dart';

abstract class AddTodoState {}

class AddTodoInitial extends AddTodoState {}

class AddTodoLoading extends AddTodoState {}

class AddTodoSuccess extends AddTodoState {}

class AddTodoFailer extends AddTodoState {
  final String errMessage;

  AddTodoFailer(this.errMessage);
}
