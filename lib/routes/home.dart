import 'package:flutter/material.dart';
import './createalert.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  var a = <String>[];

  void navigateToNewAlertPage(BuildContext context) async {
    final result = await Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => 
        CreateAlertPage())
    );

    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Container(
        child: ListView(
          children: a.map((e) => Text(e)).toList(),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => this.navigateToNewAlertPage(context),
        tooltip: 'Increment',
        child: Icon(Icons.add),
        // backgroundColor: Color.fromARGB(256, 3, 41, 42),
      ),
    );
  }
}