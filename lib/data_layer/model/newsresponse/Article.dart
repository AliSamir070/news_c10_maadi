import '../SourcesResponse/Source.dart';

/// source : {"id":"bbc-news","name":"BBC News"}
/// author : null
/// title : "'It's going to be so special' - Keating on WSL derby"
/// description : "Manchester City goalkeeper Khiara Keating looks ahead to playing in the Manchester derby in the Women's Super League."
/// url : "https://www.bbc.co.uk/sport/av/football/68642763"
/// urlToImage : "https://ichef.bbci.co.uk/news/1024/cpsprodpb/1007B/production/_132995656_p0hld2fx.jpg"
/// publishedAt : "2024-03-22T19:35:29Z"
/// content : "Manchester City goalkeeper Khiara Keating looks ahead to Saturday's Women's Super League derby against Manchester United.\r\nWatch Manchester City v Manchester United on BBC One, BBC iPlayer and the BB… [+89 chars]"

class Article {
  Article({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  Article.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  dynamic author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
Article copyWith({  Source? source,
  dynamic author,
  String? title,
  String? description,
  String? url,
  String? urlToImage,
  String? publishedAt,
  String? content,
}) => Article(  source: source ?? this.source,
  author: author ?? this.author,
  title: title ?? this.title,
  description: description ?? this.description,
  url: url ?? this.url,
  urlToImage: urlToImage ?? this.urlToImage,
  publishedAt: publishedAt ?? this.publishedAt,
  content: content ?? this.content,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}