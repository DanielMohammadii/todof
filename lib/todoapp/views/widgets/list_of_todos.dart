import 'package:flutter/material.dart';
import 'package:mytodo/todoapp/controler/todo_provider.dart';

import 'package:mytodo/todoapp/models/todo_model.dart';
import 'package:mytodo/todoapp/views/edit_page.dart';
import 'package:mytodo/utils.dart';
import 'package:provider/provider.dart';

class ListOfTodos extends StatelessWidget {
  final TodoModel? todoModel;
  const ListOfTodos({
    Key? key,
    required this.todoModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);
    final todos = provider.todos;

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: ((context, index) {
        final todo = todos[index];
        return Padding(
          padding: EdgeInsets.all(2),
          child: Card(
            color: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    todo.description,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.0,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => deletetodo(context, todo),
                        icon: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () => editTodo(context, todo),
                        icon: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  void deletetodo(BuildContext context, TodoModel todoModel) {
    final provider = Provider.of<TodoProvider>(context, listen: false);
    provider.deleteTodo(todoModel);
    Utils.showSnackbar(context, ('Remove a Task'));
  }

  void editTodo(BuildContext context, TodoModel todoModel) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EditPage(todoModel: todoModel)),
      );
}
