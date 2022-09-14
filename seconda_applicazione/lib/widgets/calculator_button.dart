import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function callback;

  // ignore: use_key_in_widget_constructors
  const CalculatorButton({
    required this.callback,
    required this.text,
    required this.fillColor,
    required this.textColor,
    required this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          width: 70,
          height: 60,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Color(fillColor),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
            ),
            onPressed: () => callback(text),
            child: Text(
              text,
              style: TextStyle(fontSize: textSize, color: Color(textColor)),
            ),
          ),
        ));
  }
}
