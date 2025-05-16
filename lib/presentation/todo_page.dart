import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_application/domain/repository/todo_repo.dart';
import 'package:todo_application/presentation/todo_cubit.dart';
import 'package:todo_application/presentation/todo_view.dart';

class TodoPage extends StatelessWidget {
  final TodoRepository todoRepository;
  const TodoPage({required this.todoRepository, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(todoRepository),
      child: TodoView(),
    );
  }
}
