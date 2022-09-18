// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, unnecessary_this, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  String text;

  Todo({
    required this.text,
  });

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      // ignore: unnecessary_string_interpolations
      child: Center(
          child: Row(children: [
        Text(
          widget.text,
          style: TextStyle(fontSize: 17),
        )
      ])),
    );
  }
}
