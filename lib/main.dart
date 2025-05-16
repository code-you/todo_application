import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_application/data/models/isar_todo.dart';
import 'package:todo_application/data/repository/isar_todo_repo.dart';
import 'package:todo_application/presentation/todo_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize your database here

  // get directory
  final dir = await getApplicationDocumentsDirectory();

  final isar = await Isar.open([TodoIsarSchema], directory: dir.path);

  final isarTodoRepo = IsarTodoRepository(isar);

  runApp(MyApp(isarTodoRepo: isarTodoRepo));
}

class MyApp extends StatelessWidget {
  final IsarTodoRepository isarTodoRepo;
  const MyApp({required this.isarTodoRepo, super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: TodoPage(todoRepository: isarTodoRepo),
    );
  }
}
