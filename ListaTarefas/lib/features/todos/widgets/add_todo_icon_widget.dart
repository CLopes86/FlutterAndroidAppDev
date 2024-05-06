import 'package:flutter/material.dart';

class AddTodoIconWidget extends StatelessWidget {
  final void Function() goToAddTodosScren;
  const AddTodoIconWidget({required this.goToAddTodosScren, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: goToAddTodosScren,
      icon: const Icon(
        Icons.add,
        color: Colors.white,
        size: 35,
      ),
    );
  }
}
