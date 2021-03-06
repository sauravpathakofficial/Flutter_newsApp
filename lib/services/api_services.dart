import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_app/model/article_model.dart';

class ApiService {
  // final endPointUrl = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=e5056f76c39d4dfd84330c01b36e7931";

  // final endPointUrl =  Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=e5056f76c39d4dfd84330c01b36e7931")     ;
  final endPointUrl =  Uri.parse("https://newsapi.org/v2/top-headlines?country=in&apiKey=e5056f76c39d4dfd84330c01b36e7931")     ;

  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl);
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];
      List<Article> articles =
      body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
      } else {
      throw ("Can't get the Articles");
    }
  }

}