import 'package:flutter/material.dart';

class TopBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Ajá!"),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}