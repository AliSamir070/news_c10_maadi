import 'package:flutter/material.dart';

import '../../../model/newsresponse/Article.dart';
import '../../../shared/api/api_manager.dart';

class NewsViewModel extends ChangeNotifier{
  List<Article> articles = [];
  String? errorMessage;
  bool isLoading = false;

  getNews(String sourceId)async{
    print("Get news");
    isLoading = true;
    errorMessage = null;
    articles = [];
    notifyListeners();
    try{
      var response = await ApiManager.getNews(sourceId);
      isLoading = false;
      if(response.status == "error"){
        errorMessage = response.message;
      }else{
        articles = response.articles??[];
      }
      notifyListeners();
    }catch(e){
      isLoading = false;
      errorMessage = e.toString();
      notifyListeners();
    }
  }
}