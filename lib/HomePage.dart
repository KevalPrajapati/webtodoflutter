import 'package:flutter/material.dart';

int currentdate = 0;

List dates = [];
List tasks = [];

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

// var taskscontext;

class HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();

  List tasker = tasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        // Container(
        //   width: MediaQuery.of(context).size.width * 0.2,
        //   color: Color(0xff373c3f),
        //   child: Nav(),
        // ),
        Container(
          width: MediaQuery.of(context).size.width * 0.2,
          color: Color(0xff373c3f),
          child: Scaffold(
            backgroundColor: Color(0xff373c3f),
            appBar: AppBar(
              title: Text("Home"),
              actions: [
                RaisedButton(
                  // onPressed: () => _selectDate(context),
                  onPressed: () {
                    setState(() {
                      dates.add(dates.length + 1);
                      tasks.add([]);
                      print(dates);
                    });
                  },
                  child: Text('Add List'),
                ),
              ],
            ),
            body: Container(
              // height: MediaQuery.of(context).size.height,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: dates.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        print(dates);
                        if (dates[index] != null) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListTile(
                              tileColor: Colors.grey,
                              focusColor: Color(0xff686868),
                              // tileColor: Color(0xff404040),
                              title: Text(
                                dates[index].toString()
                                // .substring(0, 10)
                                ,
                                style: TextStyle(color: Colors.white),
                              ),
                              onTap: () {
                                setState(() {
                                  print(currentdate);
                                  currentdate = index;
                                  print(currentdate);
                                });
                              },
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Expanded(
        //   child: Container(color: Color(0xff2f3437), child: TodoList()),
        // ),
//
//
//

        tasks.isEmpty
            ? Expanded(
                child: Container(
                  color: Color(0xff2f3437),
                  child: Center(
                      child: Text(
                    "Add List to add tasks",
                    style: TextStyle(fontSize: 50, color: Colors.grey),
                  )),
                ),
              )
            : Expanded(
                child: Container(
                  color: Color(0xff2f3437),
                  child: Container(
                    child: ListView(
                      children: [
                        ListView.builder(
                          itemCount: tasker[currentdate].length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              // color: Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ListTile(
                                  // focusColor: Color(0xff686868),
                                  // tileColor: Color(0xff404040),
                                  title: Row(
                                    children: [
                                      Text(
                                        tasker[currentdate][index],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.done,
                                          color: Colors.greenAccent,
                                        ),
                                        onPressed: () {
                                          // dates.removeAt(index);
                                          setState(() {
                                            tasks[currentdate].removeAt(index);
                                          });
                                          // tasks.re
                                        },
                                      )
                                    ],
                                  ),
                                  onTap: () {},
                                ),
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.grey,
                            child: TextField(
                              decoration:
                                  InputDecoration(hintText: "Add new task"),
                              onSubmitted: (value) {
                                setState(() {
                                  tasker[currentdate].add(value);
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ],
    ));
  }
}
