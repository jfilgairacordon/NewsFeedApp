import 'package:news_feed_app/src/models/news.dart';

import 'news_api_provider.dart';

class Repository {
  final newsApiProvider = NewsMovieProvider();

  Future<NewsModel> fetchAllNews([String topic = "Deportes"]) => newsApiProvider.fetchNewsList(topic);
}