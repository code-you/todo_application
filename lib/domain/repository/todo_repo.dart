import 'package:todo_application/domain/models/todo.model.dart';

abstract class TodoRepository {
  // add todo
  Future<void> addTodo(Todo todo);

  // get all todos
  Future<List<Todo>> getTodos();

  // update todo
  Future<void> updateTodo(Todo todo);

  // delete todo
  Future<void> deleteTodo(Todo todo);
}
