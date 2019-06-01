import 'package:intl/intl.dart';

class NewsModel{
  String _status;
  int _totalResults;
  List<NewModel> _articles;

  NewsModel.fromJson(Map<String, dynamic> parsedJson){
    _status = parsedJson["status"];
    _totalResults = parsedJson["totalResults"];
    List<NewModel> tmp = [];

    for (int i = 0; i < parsedJson['articles'].length; i++) {
      tmp.add(NewModel.fromJson(parsedJson['articles'][i]));
    }

    _articles = tmp;
  }

  String get status => _status;
  int get totalResults => _totalResults;
  List<NewModel> get articles => _articles;
}

class NewModel{
  String _author;
  String _title;
  String _description;
  String _url;
  String _urlToImage;
  String _publishedAt;
  String _content;
  NewsSource _source;

  NewModel.fromJson(Map<String, dynamic> parsedJson) {
    _author = parsedJson["author"];
    _title = parsedJson["title"];
    _description = parsedJson["description"];
    _url = parsedJson["url"];
    _urlToImage = parsedJson["urlToImage"];
    _publishedAt = parsedJson["publishedAt"];
    _content = parsedJson["content"];
    _source = NewsSource(parsedJson["source"]);
  }

  String get author => _author;
  String get title => _title;
  String get description => _description;
  String get url => _url;
  String get urlToImage => _urlToImage;
  String get publishedAt => formatDate();
  String get content => _content;
  NewsSource get source => _source;

  String formatDate(){
    final DateTime parsedDate = DateTime.parse(_publishedAt);
    String newDate = DateFormat('dd/MM/yyyy').format(parsedDate);
    return newDate;
  }
}

class NewsSource{
  String _id;
  String _name;

  NewsSource(dynamic source){
    _id = source["id"];
    _name = source["name"];
  }

  String get name => _name;
  String get id => _id;
}