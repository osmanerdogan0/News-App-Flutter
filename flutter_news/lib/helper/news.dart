import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_news/models/article.dart';

class News {

  List<Article> news  =<Article>[];

  Future<void> getNews() async{

    Uri url = Uri.parse("https://newsapi.org/v2/top-headlines?country=tr&apiKey=39d253e49c364f48862740f324be8c6b");

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(
        element['urlToImage'] != null && element['description'] != null
            && element['author'] != null
            && element['title'] != null
            && element['publishedAt'] != null
            && element['content'] != null
            && element['url'] != null
        ){
          Article article = Article(
            author: element['author'],
            title: element['title'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }

      });
    }


  }


}


class NewsForCategorie {

  List<Article> news   =<Article>[];

  Future<void> getNewsForCategory(String category) async{

    Uri url;


    if(category=="İş Dünyası"){
      url = Uri.parse("https://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey=39d253e49c364f48862740f324be8c6b");
    }
    else if(category=="Eğlence")
      url = Uri.parse("https://newsapi.org/v2/top-headlines?country=tr&category=entertainment&apiKey=39d253e49c364f48862740f324be8c6b");
    else if(category=="Genel")
      url = Uri.parse("https://newsapi.org/v2/top-headlines?country=tr&apiKey=39d253e49c364f48862740f324be8c6b");
    else if(category=="Sağlık")
      url = Uri.parse("https://newsapi.org/v2/top-headlines?country=tr&category=health&apiKey=39d253e49c364f48862740f324be8c6b");
    else if(category=="Bilim")
      url = Uri.parse("https://newsapi.org/v2/top-headlines?country=tr&category=science&apiKey=39d253e49c364f48862740f324be8c6b");
    else if(category=="Spor")
      url = Uri.parse("https://newsapi.org/v2/top-headlines?country=tr&category=sports&apiKey=39d253e49c364f48862740f324be8c6b");
    else if(category=="Teknoloji")
      url = Uri.parse("https://newsapi.org/v2/top-headlines?country=tr&category=technology&apiKey=39d253e49c364f48862740f324be8c6b");
    else{
      url = Uri.parse("https://newsapi.org/v2/top-headlines?country=tr&category=technology&apiKey=39d253e49c364f48862740f324be8c6b");

    }


    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(
        element['urlToImage'] != null && element['description'] != null
            && element['author'] != null
            && element['title'] != null
            && element['publishedAt'] != null
            && element['content'] != null
            && element['url'] != null
        ){
          Article article = Article(
            author: element['author'],
            title: element['title'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }

      });
    }


  }


}