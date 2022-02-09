import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/controllers/todo_controller.dart';
import 'package:getx_todo_app/screen/editing_screen.dart';
import 'package:getx_todo_app/screen/todo_screen.dart';

import '../models/todo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoController = Get.find<TodoController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Getx Todo"),
      ),
      body: Container(
        child: Obx(() => ListView.separated(
            itemBuilder: (ctx, index) {
              Todo todo = todoController.todos[index];
              return Dismissible(
                background: Container(
                  color: Colors.red,
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                key: UniqueKey(),
                onDismissed: (_) {
                  todoController.todos.removeAt(index);
                  Get.snackbar(
                    "Removed",
                    "Task was successfully deleted",
                    snackPosition: SnackPosition.BOTTOM,
                    duration: const Duration(seconds: 2),
                    backgroundColor: Colors.white,
                  );
                },
                child: ListTile(
                  title: Text(
                    todo.title,
                    style: todo.done
                        ? const TextStyle(
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough)
                        : const TextStyle(
                            color: Colors.black,
                          ),
                  ),
                  onTap: () {
                    Get.bottomSheet(EditingScreen(
                      index: index,
                    ));
                  },
                  leading: Checkbox(
                    onChanged: (bool? value) {
                      todo.done = value!;
                      todoController.todos[index] = todo;
                    },
                    value: todo.done,
                  ),
                  trailing: const Icon(Icons.edit),
                ),
              );
            },
            separatorBuilder: (ctx, index) => Divider(),
            itemCount: todoController.todos.length)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(TodoScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
