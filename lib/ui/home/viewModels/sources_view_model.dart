import 'package:flutter/material.dart';
import 'package:news_c10_maadi/model/SourcesResponse/SourcesResponse.dart';

import '../../../model/SourcesResponse/Source.dart';
import '../../../shared/api/api_manager.dart';

class SourcesViewModel extends ChangeNotifier{
  List<Source> sourcesList = [];
  String? errorMessage;
  bool isLoading = false;
  void getSources(String categoryId)async{
    isLoading = true;
    notifyListeners();
    try{
      SourcesResponse response = await ApiManager.getSources(categoryId);
      isLoading = false;
      if(response.status == "error"){
        errorMessage = response.message;
      }else{
        sourcesList = response.sources??[];
      }
      notifyListeners();
    }catch(e){
      isLoading = false;
      errorMessage = e.toString();
      notifyListeners();
    }
  }
}