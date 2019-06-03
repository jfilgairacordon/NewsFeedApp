import 'package:flutter/material.dart';
import 'package:news_feed_app/src/resources/global.dart';
import 'package:news_feed_app/src/services/news_service.dart';

class TopicList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TopicListState();
  }
}

class TopicListState extends State<TopicList> {
  @override
  void initState() {
    super.initState();

    // TODO: Fetch the trending topics.
  }

  @override
  void dispose() {
    // TODO: Dispose the topics stream

    super.dispose();
  }

  // Methods

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: defaultPadding),
      height: chipListHeight,
      child: new ListView(
        scrollDirection: Axis.horizontal,
        children: new List.generate(initialTags.length, (int index) {
          final currentTag = initialTags[index];
          return Padding(
            padding: EdgeInsets.only(right: bitPadding),
            child: GestureDetector(
              onTap: () { newsService.fetchAllNews(currentTag); },
              child: Chip(
                backgroundColor: Theme.of(context).primaryColor,
                label: Text("$currentTag",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                elevation: 5,
              ),
            ),
          );
        }),
      ),
    );
  }
}
