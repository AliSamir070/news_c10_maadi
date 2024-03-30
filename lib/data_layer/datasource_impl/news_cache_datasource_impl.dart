
import 'package:news_c10_maadi/data_layer/model/newsresponse/Article.dart';

import '../datasource_contract/newsdatasource.dart';
import '../model/SourcesResponse/Source.dart';

class NewsCacheDataSource extends NewsDataSource{
  @override
  Future<List<Source>> getSources(String categoryId) {
    // TODO: implement getSources
    throw UnimplementedError();
  }

  @override
  Future<List<Article>> getNews(String sourceID) {
    // TODO: implement getNews
    throw UnimplementedError();
  }

}