import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/todo_controller.dart';

class EditingScreen extends StatelessWidget {
  int index;

  EditingScreen({required this.index});

  @override
  Widget build(BuildContext context) {
    final todoController = Get.find<TodoController>();
    TextEditingController taskController = TextEditingController(
        text: todoController.todos.elementAt(index).title);

    // Cursor take place at the last position
    //taskController.selection = TextSelection.fromPosition(TextPosition(offset: taskController.text.length));
    taskController.selection = TextSelection(
        baseOffset: taskController.text.length,
        extentOffset: taskController.text.length);

    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            TextField(
              controller: taskController,
              maxLines: 10,
              keyboardType: TextInputType.multiline,
              autofocus: true,
              decoration: const InputDecoration(border: InputBorder.none),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("Cancel")),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    onPressed: () {
                      var updateTodo = todoController.todos.elementAt(index);
                      updateTodo.title = taskController.text;
                      todoController.todos[index] = updateTodo;
                      Get.back();
                    },
                    child: const Text("Add")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
