import 'package:flutter/cupertino.dart';
import 'package:mytodo/todoapp/models/todo_model.dart';

class TodoProvider with ChangeNotifier {
  final List<TodoModel> _todos = [];
  List<TodoModel> get todos => _todos;

  void addTodo(TodoModel todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void deleteTodo(TodoModel todoModel) {
    _todos.remove(todoModel);
    notifyListeners();
  }

  void editTodo(TodoModel todoModel) {
    notifyListeners();
  }
}
