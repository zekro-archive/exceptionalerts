
import 'package:flutter/material.dart';

class BasicHeading extends StatelessWidget {
  BasicHeading(this.content);

  final String content;

  @override
  Widget build(BuildContext context) {
    return Text(this.content, style: TextStyle(fontSize: 18));
  }
  
}