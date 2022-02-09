import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/models/todo.dart';

import '../controllers/todo_controller.dart';

class TodoScreen extends StatelessWidget {
  TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoController = Get.find<TodoController>();
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
              autofocus: false,
              decoration: const InputDecoration(
                hintText: "Enter your work",
                border: InputBorder.none,
              ),
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
                      todoController.todos
                          .add(Todo(title: taskController.text, done: false));
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
