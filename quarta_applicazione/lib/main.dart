// ignore_for_file: avoid_unnecessary_containers, avoid_print, unnecessary_new, prefer_const_constructors, duplicate_ignore, unnecessary_string_interpolations, prefer_collection_literals, iterable_contains_unrelated_type, unrelated_type_equality_checks, list_remove_unrelated_type
import 'package:flutter/material.dart';
import './widgets/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Todo App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Todo> entries = <Todo>[
    Todo(text: 'ciao'),
    Todo(text: 'Paolo'),
    Todo(text: 'fare la cacca'),
    Todo(text: 'Uccidere dei conigli')
  ];
  String text = '';

  void _delete() {
    setState(() {
      entries.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    int lung = entries.length;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // ignore: duplicate_ignore
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(227, 227, 227, 0.702),
        // ignore: prefer_const_constructors
        title: Text(
          'Todo: $lung',
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: _delete,
            icon: const Icon(Icons.delete_outline),
            color: Colors.black,
            tooltip: 'Elimina',
          )
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(5),
        itemCount: entries.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
              child: ListTile(
            title: Text(
              entries[index].text,
            ),
            style: ListTileStyle.list,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        entries.remove(entries[index]);
                      });
                    },
                    icon: const Icon(Icons.delete))
              ],
            ),
          ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white70,
        focusColor: Color(0xFF85FFD4),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  title: const Text("Cosa devi fare?"),
                  content: TextField(
                    decoration: InputDecoration(
                      labelText: 'Todo',
                    ),
                    onChanged: (value) {
                      setState(() {
                        text = value;
                      });
                    },
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Chiudi')),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            if (text == '') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Devi inserire un testo')));
                              Navigator.of(context).pop();
                            } else {
                              entries.add(Todo(
                                text: text,
                              ));
                              Navigator.of(context).pop();
                            }
                          });
                        },
                        child: const Text('Aggiungi')),
                  ],
                );
              });
        },
        // ignore: sort_child_properties_last
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
        tooltip: 'Aggiungi Todo',
      ),
    );
  }
}
