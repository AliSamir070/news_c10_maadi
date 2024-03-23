import 'package:flutter/material.dart';
import 'package:news_c10_maadi/shared/api/api_manager.dart';

import '../../../model/SourcesResponse/Source.dart';
import 'news_item.dart';

class NewsListWidget extends StatefulWidget {
  final Source source;
  const NewsListWidget({Key? key,required this.source}) : super(key: key);

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getNews(widget.source.id??""),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasError || snapshot.data?.status == "error"){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(snapshot.data?.message??snapshot.error.toString()),
                ElevatedButton(onPressed: (){
                  setState(() {

                  });
                }, child: Text("Try again"))
              ],
            );
          }
          var newsList = snapshot.data?.articles??[];
          return Expanded(
              child: ListView.separated(
                separatorBuilder: (context , index)=>SizedBox(height: 20,),
                itemBuilder: (context , index)=>NewsItem(
                  article: newsList[index],
                ),
                itemCount: newsList.length,
              )
          );
        }
    );
  }
}
