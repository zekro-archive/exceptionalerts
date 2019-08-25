import 'package:exceptionalerts/components/basic_heading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateAlertPage extends StatefulWidget {

  @override
  CreateAlertPageState createState() => CreateAlertPageState();
  
}

class CreateAlertPageState extends State<CreateAlertPage> {

  final textAlertNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    textAlertNameController.addListener(() => {
      
    });

    return Scaffold(
      appBar: AppBar(title: Text("Create Alert")),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: <Widget>[
          // BasicHeading("Name of the Alert"),
          TextField(
            decoration: InputDecoration(
              hintText: "Name of the Alert"
            ),
            controller: textAlertNameController,
          ),
        ],),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF8BC34A),
        child: Icon(Icons.check),
        onPressed: () => Navigator.pop(context, textAlertNameController.text),
      ),
    );
  }

  @override
  void dispose() {
    textAlertNameController.dispose();
    super.dispose();
  }
}