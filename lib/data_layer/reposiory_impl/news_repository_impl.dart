
import 'package:injectable/injectable.dart';
import 'package:news_c10_maadi/data_layer/model/newsresponse/Article.dart';
import 'package:news_c10_maadi/repository_contract/repository.dart';

import '../datasource_contract/newsdatasource.dart';
import '../model/SourcesResponse/Source.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl extends NewsRepository{
  NewsDataSource apiDataSource;
  @factoryMethod
  NewsRepositoryImpl(this.apiDataSource);
  @override
  Future<List<Source>> getSources(String categoryId) {
    return apiDataSource.getSources(categoryId);
  }

  @override
  Future<List<Article>> getNews(String sourceId) {
    return apiDataSource.getNews(sourceId);
  }

}