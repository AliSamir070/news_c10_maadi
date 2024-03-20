import 'package:flutter/material.dart';
import 'package:news_c10_maadi/model/news_model.dart';

class NewsItem extends StatelessWidget {
  NewsModel article;
  NewsItem({Key? key,required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(article.image,height: 0.25*height,width: double.infinity,fit: BoxFit.cover,)),
        Text(article.sourceName),
        Text(article.title),
        Align(
          alignment: Alignment.centerRight,
            child: Text(article.date,)),
      ],
    );
  }
}
