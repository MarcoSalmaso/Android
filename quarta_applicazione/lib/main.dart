// ignore_for_file: prefer_typing_uninitialized_variables, use_key_in_widget_constructors, unnecessary_new, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';

class Todo {
  Todo({required this.name, required this.checked});
  final String name;
  bool checked;
}

class TodoItem extends StatelessWidget {
  TodoItem({
    required this.todo,
    required this.onTodoChanged,
  }) : super(key: ObjectKey(todo));

  final Todo todo;
  final onTodoChanged;

  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return null;

    // ignore: prefer_const_constructors
    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTodoChanged(todo);
      },
      leading: CircleAvatar(
        child: Text(todo.name[0]),
      ),
      title: Text(todo.name, style: _getTextStyle(todo.checked)),
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => new _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TextEditingController _textFieldController = TextEditingController();
  final List<Todo> _todos = <Todo>[];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Todo list', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white70,
      ),
      backgroundColor: Colors.white10,
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: _todos.map((Todo todo) {
          return TodoItem(
            todo: todo,
            onTodoChanged: _handleTodoChange,
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white70,
          onPressed: () => _displayDialog(),
          tooltip: 'Aggiungi Todo',
          child: Icon(
            Icons.add,
            color: Colors.black,
          )),
    );
  }

  void _handleTodoChange(Todo todo) {
    setState(() {
      todo.checked = !todo.checked;
    });
  }

  void _addTodoItem(String name) {
    setState(() {
      _todos.add(Todo(name: name, checked: false));
    });
    _textFieldController.clear();
  }

  Future<void> _displayDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Aggiungi una cosa da fare'),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: 'Scrivi cosa fare'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Aggiungi'),
              onPressed: () {
                Navigator.of(context).pop();
                _addTodoItem(_textFieldController.text);
              },
            ),
          ],
        );
      },
    );
  }
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      home: new TodoList(),
    );
  }
}

void main() => runApp(new TodoApp());
