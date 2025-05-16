import 'package:isar/isar.dart';
import 'package:todo_application/data/models/isar_todo.dart';
import 'package:todo_application/domain/models/todo.model.dart';
import 'package:todo_application/domain/repository/todo_repo.dart';

class IsarTodoRepository implements TodoRepository {
  final Isar _db;

  IsarTodoRepository(this._db);

  @override
  Future<List<Todo>> getTodos() async {
    final todos = await _db.todoIsars.where().findAll();
    return todos.map((e) => e.toDomain()).toList();
  }

  @override
  Future<void> addTodo(Todo todo) {
    final todoIsar = TodoIsar.fromDomain(todo);
    return _db.writeTxn(() async {
      await _db.todoIsars.put(todoIsar);
    });
  }

  @override
  Future<void> deleteTodo(Todo todo) {
    return _db.writeTxn(() async {
      await _db.todoIsars.delete(todo.id);
    });
  }

  @override
  Future<void> updateTodo(Todo todo) {
    final todoIsar = TodoIsar.fromDomain(todo);
    return _db.writeTxn(() async {
      await _db.todoIsars.put(todoIsar);
    });
  }
}
