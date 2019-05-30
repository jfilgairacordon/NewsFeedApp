import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Landing page")
        ),
        body: Center(
          child: Container(
            child: Text(
              'A simple text to check if the theme is working',
              style: Theme.of(context).textTheme.display1,
            ),
          ),
        ));
  }
}
