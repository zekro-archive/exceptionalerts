import 'package:flutter/material.dart';

class PickerButton extends StatelessWidget {
  PickerButton({@required this.child, this.onPressed});

  final Widget child;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: child,
      constraints: BoxConstraints(minWidth: 50, minHeight: 30),
      fillColor: Colors.blue,
      splashColor: Colors.lightBlue,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      onPressed: onPressed,
    );
  }
}
