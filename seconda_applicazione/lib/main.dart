// ignore_for_file: prefer_const_constructors, avoid_print, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import './widgets/calculator_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calcolatrice',
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
      home: const MyHomePage(title: 'Calcolatrice Flutter'),
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
  late int firstNum;
  late int secondNum;
  late String history = '';
  late String textToDisplay = '0';
  late String res;
  late String operation;

  void btnOnCLick(String btnVal) {
    if (btnVal == 'C') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '0';
    } else if (btnVal == 'AC') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '0';
      history = '';
    } else if (btnVal == '+/-') {
      if (textToDisplay[0] != '-') {
        res = '-' + textToDisplay;
      } else {
        res = textToDisplay.substring(1);
      }
    } else if (btnVal == '<') {
      res = textToDisplay.substring(0, textToDisplay.length - 1);
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == 'X' ||
        btnVal == '/') {
      firstNum = int.parse(textToDisplay);
      res = '';
      operation = btnVal;
    } else if (btnVal == '=') {
      secondNum = int.parse(textToDisplay);
      if (operation == '+') {
        res = (firstNum + secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '-') {
        res = (firstNum - secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == 'X') {
        res = (firstNum * secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '/') {
        res = (firstNum / secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
    } else {
      res = int.parse(textToDisplay + btnVal).toString();
    }

    if (btnVal != 'AC' &&
        btnVal != 'C' &&
        btnVal != '<' &&
        btnVal != '=' &&
        btnVal != '+/-') {
      history += btnVal.toString();
    }

    setState(() {
      textToDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Calcolatrice Flutter',
            style: TextStyle(color: Color(0xFFFFFFFF)),
          ),
          backgroundColor: Color(0xFF607D8B),
        ),
        backgroundColor: Color.fromARGB(255, 203, 227, 240),
        // ignore: avoid_unnecessary_containers
        body: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              // ignore: sort_child_properties_last
              child: Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  history,
                  style: TextStyle(
                      fontSize: 30, color: Color.fromARGB(255, 154, 154, 154)),
                ),
              ),
              alignment: Alignment.center,
            ),
            Container(
              // ignore: sort_child_properties_last
              child: Padding(
                padding: EdgeInsets.only(bottom: 150),
                child: Text(
                  textToDisplay,
                  style: TextStyle(fontSize: 56),
                ),
              ),
              alignment: Alignment.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Expanded(
                    child: CalculatorButton(
                  text: 'AC',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF000000,
                  textSize: 22,
                  callback: btnOnCLick,
                )),
                Expanded(
                    child: CalculatorButton(
                  text: 'C',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnCLick,
                )),
                Expanded(
                    child: CalculatorButton(
                  text: '<',
                  fillColor: 0xFFf4d160,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnCLick,
                )),
                Expanded(
                    child: CalculatorButton(
                  text: '/',
                  fillColor: 0xFFf4d160,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnCLick,
                )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Expanded(
                    child: CalculatorButton(
                  text: '7',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnCLick,
                )),
                Expanded(
                    child: CalculatorButton(
                  text: '8',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnCLick,
                )),
                Expanded(
                    child: CalculatorButton(
                  text: '9',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnCLick,
                )),
                Expanded(
                    child: CalculatorButton(
                  text: 'X',
                  fillColor: 0xFFf4d160,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnCLick,
                )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Expanded(
                    child: CalculatorButton(
                  text: '6',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnCLick,
                )),
                Expanded(
                    child: CalculatorButton(
                  text: '5',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnCLick,
                )),
                Expanded(
                    child: CalculatorButton(
                  text: '4',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnCLick,
                )),
                Expanded(
                    child: CalculatorButton(
                  text: '-',
                  fillColor: 0xFFf4d160,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnCLick,
                )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Expanded(
                    child: CalculatorButton(
                  text: '3',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnCLick,
                )),
                Expanded(
                    child: CalculatorButton(
                  text: '2',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnCLick,
                )),
                Expanded(
                    child: CalculatorButton(
                  text: '1',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnCLick,
                )),
                Expanded(
                    child: CalculatorButton(
                  text: '+',
                  fillColor: 0xFFf4d160,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnCLick,
                )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Expanded(
                    child: CalculatorButton(
                  text: '+/-',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF000000,
                  textSize: 22,
                  callback: btnOnCLick,
                )),
                Expanded(
                    child: CalculatorButton(
                  text: '0',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnCLick,
                )),
                Expanded(
                    child: CalculatorButton(
                  text: '00',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnCLick,
                )),
                Expanded(
                    child: CalculatorButton(
                  text: '=',
                  fillColor: 0xFFf4d160,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnCLick,
                )),
              ],
            ),
          ],
        )));
  }
}
