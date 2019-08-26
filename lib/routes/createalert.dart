import 'package:exceptionalerts/components/picker_button.dart';
import 'package:exceptionalerts/models/alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateAlertPage extends StatefulWidget {
  @override
  CreateAlertPageState createState() => CreateAlertPageState();
}

class CreateAlertPageState extends State<CreateAlertPage> {
  final textAlertNameController = TextEditingController();
  DateTime dateTime;

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
    Navigator.pop(
        context,
        AlertModel(
          name: textAlertNameController.text,
          time: null,
        ));
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
              Text(
                dateTime != null ? dateTime.toIso8601String() : 'unset',
                textAlign: TextAlign.left,
              ),
              Row(
                children: <Widget>[
                  PickerButton(
                    child: Icon(
                      Icons.access_time,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      final now = DateTime.now();
                      var date = showDatePicker(
                          context: context,
                          initialDate: now,
                          firstDate: now,
                          lastDate: DateTime(2999),
                          builder: (BuildContext context, Widget child) {
                            return Theme(
                              data: ThemeData.light(),
                              child: child,
                            );
                          });

                      date.then((v) {
                        setState(() {
                          dateTime = v;
                        });
                      });
                    },
                  )
                ],
              )
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
