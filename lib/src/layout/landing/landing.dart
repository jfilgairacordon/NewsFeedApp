import 'package:flutter/material.dart';
import 'package:news_feed_app/src/layout/landing/news_item.dart';
import 'package:news_feed_app/src/layout/landing/top.dart';
import 'package:news_feed_app/src/layout/landing/topics_list.dart';
import 'package:news_feed_app/src/models/news.dart';
import 'package:news_feed_app/src/services/news_service.dart';

class Landing extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LandingState();
  }
}

class LandingState extends State<Landing> {
  // Equivalente al ngOnInit.
  // Al ejecutar el initState, rellenamos el subject con las noticias.
  @override
  void initState() {
    super.initState();
    newsService.fetchAllNews();
  }

  // Equivalente al ngOnDestroy
  // Nos cargamos las subs de los observables
  // para evitar memory leaks.
  @override
  void dispose() {
    newsService.dispose();
    super.dispose();
  }

  // Métodos
  Widget buildList(AsyncSnapshot<NewsModel> snapshot) {
    List<Widget> finalWidgets = [Top(), TopicList()];
    finalWidgets = _buildWigetListBasedOnNewsModel(snapshot.data.articles, finalWidgets);
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(
            finalWidgets,
          ),
        ),
      ],
    );
  }

  List<Widget> _buildWigetListBasedOnNewsModel(List<NewModel> news, List<Widget>finalWidgets){
    news.forEach((newItem) {
      finalWidgets.add(NewsItem(newModel: newItem,));
    });

    return finalWidgets;
  }

  // Entry point de la clase, construye el widget.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: StreamBuilder(
        stream: newsService.allNews,
        builder: (context, AsyncSnapshot<NewsModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      )),
    );
  }
}
