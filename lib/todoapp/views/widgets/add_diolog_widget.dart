import 'package:flutter/material.dart';
import 'package:mytodo/todoapp/controler/todo_provider.dart';
import 'package:mytodo/todoapp/models/todo_model.dart';
import 'package:provider/provider.dart';

class AddTodoDialogWidget extends StatefulWidget {
  const AddTodoDialogWidget({Key? key}) : super(key: key);

  @override
  State<AddTodoDialogWidget> createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  final _desController = TextEditingController();
  final _titleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Add Todo",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Form(
            key: _formKey,
            child: Column(
              children: [
                buildtitle(),
                builddes(),
                const SizedBox(height: 20),
                buildbtn(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildbtn() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Color.fromARGB(255, 201, 18, 18)),
        ),
        onPressed: addTodo,
        child: const Text('Save'),
      ),
    );
  }

  TextFormField builddes() {
    return TextFormField(
      maxLines: 3,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        label: Text("Todos"),
      ),
      controller: _desController,
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please the description';
        }
        return null;
      },
    );
  }

  TextFormField buildtitle() {
    return TextFormField(
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        label: Text("Title"),
      ),
      controller: _titleController,
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please Your title';
        }
        return null;
      },
    );
  }

  void addTodo() {
    if (_formKey.currentState!.validate()) {
      final todo = TodoModel(
        id: DateTime.now().toString(),
        title: _titleController.text,
        description: _desController.text,
        createdTime: DateTime.now(),
      );
      final provider = Provider.of<TodoProvider>(context, listen: false);
      provider.addTodo(todo);
      Navigator.pop(context);
    }
  }
}
