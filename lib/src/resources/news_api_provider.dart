import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:news_feed_app/src/models/news.dart';
import 'package:news_feed_app/src/resources/global.dart';
import 'package:intl/intl.dart';

class NewsMovieProvider {
  Client client = Client();

  Future<NewsModel> fetchNewsList() async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    final response = await client.get("$apiUrl/everything?q=motogp&$formattedDate&apiKey=$apiKey");
    if (response.statusCode == 200)
    {
      return NewsModel.fromJson(json.decode(response.body));
    }
    else{
      throw Exception('Failed to load GET');
    }
  }
}