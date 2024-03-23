import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_c10_maadi/model/newsresponse/Article.dart';

class NewsItem extends StatelessWidget {
  Article article;

  NewsItem({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CachedNetworkImage(
            imageUrl: article.urlToImage ?? "",
            height: 0.25 * height,
            width: double.infinity,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Text(article.source?.name ?? ""),
        Text(article.title ?? ""),
        Align(
            alignment: Alignment.centerRight,
            child: Text(
              article.publishedAt ?? "",
            )),
      ],
    );
  }
}
