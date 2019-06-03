import 'package:news_feed_app/src/models/news.dart';
import 'package:news_feed_app/src/resources/global.dart';
import 'package:news_feed_app/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class NewsService{
  final _repository = Repository();
  final _newsFetcher = PublishSubject<NewsModel>();
  final _selectedTopic = initialTopic;

  Observable<NewsModel> get allNews => _newsFetcher.stream;

  fetchAllNews([String topic = "Deportes"]) async {
    NewsModel newsModel = await _repository.fetchAllNews(topic);
    _newsFetcher.sink.add(newsModel);
  }

  String get selectedTopic => _selectedTopic;
  set selectedTopic(String value) => _selectedTopic;

  dispose(){
    _newsFetcher.close();
  }
}

final newsService = NewsService();