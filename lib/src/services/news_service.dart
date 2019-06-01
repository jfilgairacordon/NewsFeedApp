import 'package:news_feed_app/src/models/news.dart';
import 'package:news_feed_app/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class NewsService{
  final _repository = Repository();
  final _newsFetcher = PublishSubject<NewsModel>();

  Observable<NewsModel> get allNews => _newsFetcher.stream;

  fetchAllNews() async {
    NewsModel newsModel = await _repository.fetchAllNews();
    _newsFetcher.sink.add(newsModel);
  }

  dispose(){
    _newsFetcher.close();
  }
}

final newsService = NewsService();