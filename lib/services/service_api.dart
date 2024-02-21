import 'dart:convert';

import 'package:submisi_1/model/article_model.dart';
import 'package:http/http.dart';

class ApiService{
  // final endPointUrl =
  // "https://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=4819bb27e56e4dd498df4bc4430a35b1";

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse("https://newsapi.org/v2/everything?q=bitcoin&apiKey=4819bb27e56e4dd498df4bc4430a35b1"));
    
    if (res.statusCode == 200) {
      Map<String, dynamic> json =jsonDecode(res.body);
      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}

