import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_c10_maadi/model/SourcesResponse/SourcesResponse.dart';
import 'package:news_c10_maadi/model/newsresponse/NewsResponse.dart';
class ApiManager{
  static const String baseUrl = "newsapi.org";
  static const String apiKey = "d3e16e322c2e4c00b4b4f4967c290a7f";
  static Future<SourcesResponse> getSources(String categoryId)async{

    var url = Uri.https(baseUrl,"/v2/top-headlines/sources",{
      "apiKey":apiKey,
      "category":categoryId
    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }

  static Future<NewsResponse> getNews(String sourceId) async{


    var url = Uri.https(baseUrl,"/v2/everything",{
      "apiKey":apiKey,
      "sources":sourceId
    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(json);
    return newsResponse;

  }
}