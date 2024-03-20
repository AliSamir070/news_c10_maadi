import 'package:flutter/material.dart';
import 'package:news_c10_maadi/model/news_model.dart';

import 'news_item.dart';

class NewsListWidget extends StatelessWidget {
  const NewsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
            separatorBuilder: (context , index)=>SizedBox(height: 20,),
            itemBuilder: (context , index)=>NewsItem(
              article: NewsModel.newsList[index],
            ),
            itemCount: NewsModel.newsList.length,
        )
    );
  }
}
