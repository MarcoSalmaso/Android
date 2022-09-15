// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

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
      title: 'Calcolatore massa corporea',
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
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Indice Massa Corporea'),
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
  double peso = 0;
  double altezza = 0;
  double imc = 0;
  String descrizione = '';

  void _reset() {
    setState(() {
      peso = 0;
      altezza = 0;
      imc = 0;
      descrizione = '';
    });
  }

  void _calcola() {
    setState(() {
      imc = peso / (altezza * altezza);
      imc.toDouble();
      if (imc < 18.5) {
        descrizione = 'Sottopeso';
      } else if (imc >= 18.5 && imc < 25) {
        descrizione = 'Normopeso';
      } else if (imc >= 25 && imc < 30) {
        descrizione = 'Sovrappeso';
      } else if (imc >= 30 && imc < 40) {
        descrizione = 'Obesità';
      } else {
        descrizione = 'Estrema obesità';
      }
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
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: _reset, icon: const Icon(Icons.restart_alt))
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Text(
                // ignore: prefer_interpolation_to_compose_strings
                'IMC: ' + imc.toStringAsFixed(1),
                style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Expanded(
                    child: Text(descrizione,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30)))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  'Peso: $peso',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Altezza: $altezza',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                  width: 180,
                  height: 150,
                  child: TextField(
                    style: const TextStyle(
                        fontSize: 15.0, height: 2.0, color: Colors.black),
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: "Peso (in kg)"),
                    onSubmitted: (value) {
                      setState(() {
                        peso = double.parse(value);
                      });
                    },
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                  width: 180,
                  height: 150,
                  child: TextField(
                    style: const TextStyle(
                        fontSize: 15.0, height: 2.0, color: Colors.black),
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: "Altezza (in metri)"),
                    onSubmitted: (value) {
                      setState(() {
                        altezza = double.parse(value);
                      });
                    },
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                FloatingActionButton(
                  onPressed: _calcola,
                  child: const Icon(Icons.calculate),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
