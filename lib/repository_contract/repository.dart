
import '../data_layer/model/SourcesResponse/Source.dart';
import '../data_layer/model/newsresponse/Article.dart';

abstract class NewsRepository{
  Future<List<Source>> getSources(String categoryId);
  Future<List<Article>> getNews(String sourceId);
}
// interface : abstract class with abstract functions