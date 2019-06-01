import 'package:flutter/material.dart';
import 'package:news_feed_app/src/resources/global.dart';

class Top extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(),
            Image.asset("assets/images/logo.png", height: 70,),
            Icon(Icons.account_circle)
          ],
        )
    );
  }
}