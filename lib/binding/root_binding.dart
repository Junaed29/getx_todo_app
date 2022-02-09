import 'package:get/get.dart';
import 'package:getx_todo_app/controllers/todo_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoController>(() => TodoController());
  }
}
