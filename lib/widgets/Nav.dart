import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  @override
  NavState createState() => NavState();
}

List dates = [2020 - 10 - 01];
List tasks = ["kaam hi kaam"];

class NavState extends State<Nav> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);
    print(formatted);
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        dates.add(picked);
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff373c3f),
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          RaisedButton(
            onPressed: () => _selectDate(context),
            child: Text('Select date'),
          ),
        ],
      ),
      body: Container(
        // height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            ListView.builder(
              itemCount: dates.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  focusColor: Color(0xff686868),
                  // tileColor: Color(0xff404040),
                  title: Text(
                    dates[index].toString().substring(0, 10),
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
