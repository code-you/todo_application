import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_application/domain/models/todo.model.dart';
import 'package:todo_application/domain/repository/todo_repo.dart';

class TodoCubit extends Cubit<List<Todo>> {
  final TodoRepository _todoRepository;
  TodoCubit(this._todoRepository) : super([]) {
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    final todos = await _todoRepository.getTodos();
    emit(todos);
  }

  Future<void> addTodo(String text) async {
    final todo = Todo(id: DateTime.now().millisecondsSinceEpoch, text: text);

    await _todoRepository.addTodo(todo);
    _loadTodos();
  }

  Future<void> updateTodo(Todo todo) async {
    await _todoRepository.updateTodo(todo);
    _loadTodos();
  }

  void deleteTodo(Todo todo) async {
    await _todoRepository.deleteTodo(todo);
    _loadTodos();
  }

  void toggleTodo(Todo todo) async {
    final updatedTodo = todo.toggleCompletion();
    await _todoRepository.updateTodo(updatedTodo);
    _loadTodos();
  }
}
