import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/todo.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;

  @override
  void onInit() {
    List? existTodoList = GetStorage().read<List>("todos");
    if (existTodoList != null) {
      todos.value = existTodoList.map((e) {
        print(e);
        return Todo.fromJson(e);
      }).toList();
    }

    ever(todos, (List<Todo> todoList) {
      GetStorage().write("todos", todoList.toList());
    });

    super.onInit();
  }
}
