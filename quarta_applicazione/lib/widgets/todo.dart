// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, unnecessary_this, sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  Text text;
  // ignore: prefer_typing_uninitialized_variables
  var sel;

  Todo({
    required this.text,
  });

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  bool selected = false;

  void changeSel() {
    setState(() {
      widget.text = Text('ciao');
      selected = !selected;
      widget.sel = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListTile(
      title: widget.text,
      style: ListTileStyle.list,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                var txt = widget.text.data;
                if (selected == false) {
                  widget.text = Text(
                    txt.toString(),
                    style: TextStyle(decoration: TextDecoration.lineThrough),
                  );
                } else {
                  widget.text = Text(
                    txt.toString(),
                    style: TextStyle(decoration: TextDecoration.none),
                  );
                }
                changeSel();
              });
              print(widget.sel);
            },
            icon: const Icon(Icons.delete),
            tooltip: 'Elimina',
          )
        ],
      ),
    ));
  }
}
