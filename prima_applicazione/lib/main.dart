import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First App',
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
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'La mia prima applicazione'),
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
  int _var = 2;
  int _counter = 2;
  int _pot = 1;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      //_counter++;
      _counter = _counter * _var;
      _pot += 1;
    });
  }

  // ignore: unused_element
  void _resetCounter() {
    setState(() {
      _var = 2;
      _counter = 2;
      _pot = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: const Color.fromARGB(255, 250, 70, 5),
        child: Container(height: 50.0),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        // ignore: prefer_const_constructors
        title: Text('Elevamento a potenza'),
        // ignore: prefer_const_constructors
        leading: Icon(
          Icons.calculate_outlined,
          size: 25,
          color: Colors.black,
        ),
        // ignore: prefer_const_constructors
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          // ignore: prefer_const_constructors
          IconButton(
            icon: const Icon(Icons.restart_alt),
            tooltip: 'Resetta contatore',
            onPressed: () {
              _resetCounter();
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Hai resettato il contatore')));
            },
          ),
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 180,
              height: 150,
              // ignore: prefer_const_constructors
              child: TextField(
                style: const TextStyle(
                    fontSize: 15.0, height: 2.0, color: Colors.black),
                decoration: const InputDecoration(
                  labelText: "Inserisci un numero",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _pot = 1;
                    _var = int.parse(value);
                    _counter = _var;
                  });
                },
              ),
            ),
            Text(
              '$_var elevato a $_pot',
              // ignore: prefer_const_constructors
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
            const Icon(
              Icons.arrow_drop_down,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Incrementa',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
