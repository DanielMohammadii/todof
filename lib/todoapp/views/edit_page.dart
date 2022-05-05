import 'package:flutter/material.dart';
import 'package:mytodo/todoapp/models/todo_model.dart';

class EditPage extends StatefulWidget {
  final TodoModel todoModel;

  const EditPage({Key? key, required this.todoModel}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final descontroleer = TextEditingController();
  final titlecontroleer = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EditPage')),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
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
      ),
    );
  }

  SizedBox buildbtn() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Color.fromARGB(255, 40, 185, 47)),
        ),
        onPressed: () {},
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
      controller: descontroleer,
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
      controller: titlecontroleer,

      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please Your title';
        }
        return null;
      },
    );
  }
}
