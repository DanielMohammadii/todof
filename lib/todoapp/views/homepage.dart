import 'package:flutter/material.dart';

import 'package:mytodo/todoapp/models/todo_model.dart';
import 'package:mytodo/todoapp/views/widgets/list_of_todos.dart';

import 'widgets/add_diolog_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TodoModel? todoModel;

  @override
  Widget build(BuildContext context) {
    FloatingActionButton floatbtn() {
      return FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 212, 44, 32),
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            content: AddTodoDialogWidget(),
          ),
        ),
        child: const Icon(Icons.add),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('HomePage'),
        centerTitle: true,
      ),
      body: ListOfTodos(
        todoModel: todoModel,
      ),
      floatingActionButton: floatbtn(),
    );
  }
}
