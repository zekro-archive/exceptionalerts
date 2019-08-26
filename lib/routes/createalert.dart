import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateAlertPage extends StatefulWidget {
  @override
  CreateAlertPageState createState() => CreateAlertPageState();
}

class CreateAlertPageState extends State<CreateAlertPage> {
  final textAlertNameController = TextEditingController();

  void _showErrorSnackBar(BuildContext context, String content) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(content),
      backgroundColor: Colors.red,
    ));
  }

  void _onAccept(BuildContext context) {
    if (textAlertNameController.text.length < 1) {
      _showErrorSnackBar(context, "Please enter a name for the alert!");
      return;
    }
    Navigator.pop(context, textAlertNameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Create Alert")),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: "Name of the Alert"),
                controller: textAlertNameController,
              ),
            ],
          ),
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            backgroundColor: Color(0xFF8BC34A),
            child: Icon(Icons.check),
            onPressed: () => _onAccept(context),
          ),
        ));
  }

  @override
  void dispose() {
    textAlertNameController.dispose();
    super.dispose();
  }
}
