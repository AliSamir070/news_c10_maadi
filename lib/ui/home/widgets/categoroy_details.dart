import 'package:flutter/material.dart';
import 'package:news_c10_maadi/model/source_model.dart';
import 'package:news_c10_maadi/ui/home/widgets/news_list_widget.dart';
import 'package:news_c10_maadi/ui/home/widgets/source_widget.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDetails({Key? key}) : super(key: key);

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  int selectedSource = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: SourceModel.sources.length,
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
                tabs: SourceModel.sources.map((source) => SourceWidget(
                  source: source,
                  isSelected: selectedSource == SourceModel.sources.indexOf(source),
                )).toList()
            ),
            NewsListWidget()
          ],
        ),
      ),
    );
  }
}
