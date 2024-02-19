import 'package:get/get.dart';
import 'package:to_do_app/model/todo.dart';

class ToDoController extends GetxController {
  var todos = <ToDo>[].obs;

  @override
  void onInit() {
    super.onInit();
    todos.assignAll(ToDo.todoList());
  }

  void addToDoItem(String toDoText) {
    if (toDoText.isNotEmpty) {
      final newToDo = ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDoText,
      );
      todos.add(newToDo);
    }
  }

  void deleteToDoItem(String id) {
    todos.removeWhere((todo) => todo.id == id);
  }

  void toggleToDoStatus(ToDo todo) {
    todo.isDone = !todo.isDone;
    todos.refresh();
  }
}
