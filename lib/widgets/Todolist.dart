import 'package:flutter/material.dart';

import '../HomePage.dart';

class TodoList extends StatefulWidget {
  List tassks;
  TodoList({this.tassks});

  @override
  _TodoListState createState() => _TodoListState(tassks);
}

class _TodoListState extends State<TodoList> {
  List tassks;
  _TodoListState(this.tassks);
  List tasker = tasks;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          ListView.builder(
            itemCount: tasker[currentdate].length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                focusColor: Color(0xff686868),
                // tileColor: Color(0xff404040),
                title: Text(
                  tasker[currentdate][index],
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {},
              );
            },
          ),
        ],
      ),
    );
  }
}
