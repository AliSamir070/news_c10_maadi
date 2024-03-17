import 'package:flutter/material.dart';
import 'package:news_c10_maadi/model/category_model.dart';
import 'package:news_c10_maadi/ui/home/widgets/categories_widget.dart';
import 'package:news_c10_maadi/ui/home/widgets/categoroy_details.dart';
import 'package:news_c10_maadi/ui/home/widgets/home_drawer_widget.dart';
import 'package:news_c10_maadi/ui/home/widgets/settings_widget.dart';

class HomeScreen extends StatefulWidget {
  static String routename = "HomeScreen";
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget selectedWidget;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidget = CategoriesWidget(categoryClick: onCategoryItemClick);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover
        )
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("News App"),
        ),
        drawer: HomeDrawerWidget(
          itemClick: onMenuItemClick,
        ),
        body: selectedWidget,
      ),

    );
  }

  void onMenuItemClick(MenuItem item){
    switch(item){
      case MenuItem.Categories:{
        selectedWidget = CategoriesWidget(
          categoryClick: onCategoryItemClick,
        );
        Navigator.of(context).pop();
        setState((){});
      }
      break;
      case MenuItem.Settings:{
        selectedWidget = SettingsWidget();
        Navigator.of(context).pop();
        setState((){});
      }
      break;
    }
  }
  void onCategoryItemClick(CategoryModel categoryModel){
    selectedWidget = CategoryDetails();
    setState(() {

    });
  }
}
