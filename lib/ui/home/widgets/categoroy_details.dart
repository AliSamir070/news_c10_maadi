import 'package:flutter/material.dart';
import 'package:news_c10_maadi/shared/api/api_manager.dart';
import 'package:news_c10_maadi/ui/home/widgets/news_list_widget.dart';
import 'package:news_c10_maadi/ui/home/widgets/source_widget.dart';

import '../../../model/category_model.dart';

class CategoryDetails extends StatefulWidget {
  CategoryModel categoryModel;
  CategoryDetails({Key? key,required this.categoryModel}) : super(key: key);

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  int selectedSource = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSources(widget.categoryModel.id),
        builder: (context , snapshot){
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
          var sources = snapshot.data?.sources??[];
          return DefaultTabController(
            length: sources.length,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TabBar(
                      onTap: (index){
                        selectedSource = index;
                        setState(() {

                        });
                      },
                      isScrollable: true,
                      indicatorColor: Colors.transparent,
                      dividerColor: Colors.transparent,
                      tabs: sources.map((source) => SourceWidget(
                        source: source,
                        isSelected: selectedSource == sources.indexOf(source),
                      )).toList()
                  ),
                  NewsListWidget(source: sources[selectedSource],)
                ],
              ),
            ),
          );
        }
    );
  }
}
