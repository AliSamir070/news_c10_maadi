import '../model/SourcesResponse/Source.dart';
import '../model/newsresponse/Article.dart';

abstract class NewsDataSource{
  Future<List<Source>> getSources(String  categoryId);
  Future<List<Article>> getNews(String sourceID);
}