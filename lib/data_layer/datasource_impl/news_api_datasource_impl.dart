import 'package:injectable/injectable.dart';
import 'package:news_c10_maadi/data_layer/model/newsresponse/Article.dart';
import 'package:news_c10_maadi/shared/api/api_manager.dart';

import '../datasource_contract/newsdatasource.dart';
import '../model/SourcesResponse/Source.dart';

@Injectable(as: NewsDataSource)
class NewsApiDataSourceImpl extends NewsDataSource{
  late ApiManager apimanager;
  @factoryMethod
  NewsApiDataSourceImpl(this.apimanager);// constructor injection
  @override
  Future<List<Source>> getSources(String categoryId) async{
    var sourcesResponse = await apimanager.getSources(categoryId);
    return sourcesResponse.sources??[];
  }

  @override
  Future<List<Article>> getNews(String sourceID) async{
    var newsResponse = await apimanager.getNews(sourceID);
    return newsResponse.articles??[];
  }

}