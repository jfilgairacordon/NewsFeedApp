import 'package:flutter/material.dart';
import 'package:news_feed_app/src/models/news.dart';
import 'package:news_feed_app/src/resources/global.dart';

class NewsItem extends StatelessWidget {
  final NewModel newModel;

  NewsItem({Key key, @required this.newModel})
      : assert(newModel != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: defaultPadding, right: defaultPadding, bottom: defaultPadding),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: kElevationToShadow[3],
          borderRadius: BorderRadius.all(
              Radius.elliptical(defaultBorderRadius, defaultBorderRadius)),
        ),
        child: Column(children: <Widget>[
          // News Image Container
          Container(
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(
                      defaultBorderRadius, defaultBorderRadius),
                  topRight: Radius.elliptical(
                      defaultBorderRadius, defaultBorderRadius),
                ),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(this.newModel.urlToImage))),
          ),
          // The info
          Container(
            padding: EdgeInsets.all(bitPadding),
            child: Column(
              children: <Widget>[
                // Title
                  Text(this.newModel.title,
                      style: Theme.of(context).textTheme.title),
                // Description
                Padding(
                  padding: EdgeInsets.only(top: bitPadding, bottom: bitPadding),
                  child:
                  Text(this.newModel.description, style: Theme.of(context).textTheme.body1,),
                ),
                // Author
                Row(
                  children: <Widget>[
                    //Padding:
                    Icon(Icons.language),
                    Padding(
                      padding: EdgeInsets.only(left: bitPadding),
                      child: Text("${this.newModel.source.name} · ${this.newModel.publishedAt}", style: Theme.of(context).textTheme.caption,),
                    )
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
