import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_c10_maadi/data_layer/datasource_impl/news_cache_datasource_impl.dart';

import 'package:news_c10_maadi/shared/api/api_manager.dart';

import '../../../data_layer/datasource_contract/newsdatasource.dart';
import '../../../data_layer/datasource_impl/news_api_datasource_impl.dart';
import '../../../data_layer/model/SourcesResponse/Source.dart';
import '../../../data_layer/model/newsresponse/Article.dart';
import '../../../data_layer/reposiory_impl/news_repository_impl.dart';
import '../../../repository_contract/repository.dart';

@injectable
class CategoryDetailsViewModel extends Cubit<CategoryDetailsState>{
   NewsRepository repository;
   @factoryMethod
  CategoryDetailsViewModel(this.repository):super(CategoryDetailsLoadingState());

  static CategoryDetailsViewModel get(BuildContext context)=>BlocProvider.of(context);
  getSources(String categoryid)async{
    emit(CategoryDetailsLoadingState());
    try{
      var sourcesList = await repository.getSources(categoryid);
      emit(CategoryDetailsSourcesSuccessState(sourcesList));
      /*if(sourcesResponse.status == "error"){
        emit(CategoryDetailsErrorState(sourcesResponse.message??""));
      }else{
        emit(CategoryDetailsSourcesSuccessState(sourcesResponse.sources??[]));
      }*/
    }catch(e){
      emit(CategoryDetailsErrorState(e.toString()));
    }

  }

  getNews(String sourceid)async{
    emit(CategoryDetailsNewsLoadingState());
    try{
      var newsList = await repository.getNews(sourceid);
      emit(CategoryNewsSuccessState(newsList));
      /*if(newsResponse.status == "error"){
        emit(CategoryDetailsNewsErrorState(newsResponse.message??""));
      }else{
        emit(CategoryNewsSuccessState(newsResponse.articles??[]));
      }*/
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