import 'package:flutter/material.dart';
import 'package:news_c10_maadi/shared/api/api_manager.dart';
import 'package:news_c10_maadi/ui/home/viewModels/news_view_model.dart';
import 'package:provider/provider.dart';

import '../../../model/SourcesResponse/Source.dart';
import 'news_item.dart';

class NewsListWidget extends StatefulWidget {
  Source source;
  NewsListWidget({required this.source});
  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  var viewModel = NewsViewModel();
  @override
  void initState() {
    super.initState();
    print("initState");
    viewModel.getNews(widget.source.id??"");
  }

  @override
  void didUpdateWidget( oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didupdatewidget");
    viewModel.getNews(widget.source.id??"");
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_)=>viewModel,
      child: Consumer<NewsViewModel>(
        builder: (BuildContext context, NewsViewModel value, Widget? child) {
          if(viewModel.isLoading){
            return Center(child: CircularProgressIndicator(),);
          }else if(viewModel.errorMessage != null){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(viewModel.errorMessage??""),
                ElevatedButton(onPressed: (){
                  viewModel.getNews(widget.source.id??"");
                }, child: Text("Try again"))
              ],
            );
          }
          var newsList = viewModel.articles;
          return Expanded(
              child: ListView.separated(
                separatorBuilder: (context , index)=>SizedBox(height: 20,),
                itemBuilder: (context , index)=>NewsItem(
                  article: newsList[index],
                ),
                itemCount: newsList.length,
              )
          );
        },

      ),
    )/*FutureBuilder(
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
    )*/;
  }
}
