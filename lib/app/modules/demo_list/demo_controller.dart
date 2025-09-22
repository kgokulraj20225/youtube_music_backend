import 'package:get/get.dart';

class TodoController extends GetxController {
  // Reactive list
  var todos = <String>[].obs;

  // Add new todo
  void addTodo(String task) {
    if (task.isNotEmpty) {
      todos.add(task);
    }
  }

  // Remove todo
  void removeTodo(int index) {
    todos.removeAt(index);
  }
}
