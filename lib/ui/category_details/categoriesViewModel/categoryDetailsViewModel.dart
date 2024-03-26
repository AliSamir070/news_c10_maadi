import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_c10_maadi/shared/api/api_manager.dart';

import '../../../model/SourcesResponse/Source.dart';
import '../../../model/newsresponse/Article.dart';

class CategoryDetailsViewModel extends Cubit<CategoryDetailsState>{
  CategoryDetailsViewModel():super(CategoryDetailsLoadingState());

  static CategoryDetailsViewModel get(BuildContext context)=>BlocProvider.of(context);
  getSources(String categoryid)async{
    emit(CategoryDetailsLoadingState());
    try{
      var sourcesResponse = await ApiManager.getSources(categoryid);
      if(sourcesResponse.status == "error"){
        emit(CategoryDetailsErrorState(sourcesResponse.message??""));
      }else{
        emit(CategoryDetailsSourcesSuccessState(sourcesResponse.sources??[]));
      }
    }catch(e){
      emit(CategoryDetailsErrorState(e.toString()));
    }

  }

  getNews(String sourceid)async{
    emit(CategoryDetailsNewsLoadingState());
    try{
      var newsResponse = await ApiManager.getNews(sourceid);
      if(newsResponse.status == "error"){
        emit(CategoryDetailsNewsErrorState(newsResponse.message??""));
      }else{
        emit(CategoryNewsSuccessState(newsResponse.articles??[]));
      }
    }catch(e){
      emit(CategoryDetailsNewsErrorState(e.toString()));
    }
  }
}

abstract class CategoryDetailsState{}
class CategoryDetailsLoadingState extends CategoryDetailsState{}
class CategoryDetailsErrorState extends CategoryDetailsState{
  String errorMessage;
  CategoryDetailsErrorState(this.errorMessage);
}
class CategoryDetailsSourcesSuccessState extends CategoryDetailsState{
  List<Source> sources;
  CategoryDetailsSourcesSuccessState(this.sources);
}
class CategoryNewsSuccessState extends CategoryDetailsState{
  List<Article> articles;
  CategoryNewsSuccessState(this.articles);
}
class CategoryDetailsNewsLoadingState extends CategoryDetailsState{}
class CategoryDetailsNewsErrorState extends CategoryDetailsState{
  String errorMessage;
  CategoryDetailsNewsErrorState(this.errorMessage);
}