// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_application/data/repository/isar_todo_repo.dart';
import 'package:todo_application/domain/models/todo.model.dart';

import 'package:todo_application/main.dart';

// A fake implementation of IsarTodoRepo for testing purposes.
// Replace 'IsarTodoRepo' with the actual abstract class or interface your app uses.
class FakeIsarTodoRepo implements IsarTodoRepository {
  @override
  Future<void> addTodo(dynamic todo) async {
    // Dummy implementation
  }

  @override
  Future<void> deleteTodo(dynamic id) async {
    // Dummy implementation
  }

  @override
  Future<List<Todo>> getTodos() async {
    // Dummy implementation
    return [];
  }

  @override
  Future<void> updateTodo(dynamic todo) async {
    // Dummy implementation
  }
}

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // Provide a mock or fake isarTodoRepo as required by MyApp
    await tester.pumpWidget(MyApp(isarTodoRepo: FakeIsarTodoRepo()));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
