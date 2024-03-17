import 'package:flutter/material.dart';

typedef onMenuItemClick = void Function(MenuItem item);
class HomeDrawerWidget extends StatelessWidget {
  onMenuItemClick itemClick;
  HomeDrawerWidget({Key? key,required this.itemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:  Column(
        children: [
          Container(
              alignment: Alignment.center,
              color: Theme.of(context).colorScheme.primary,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: 40,
              ),
              child: Text("News App!",style: Theme.of(context).textTheme.headlineLarge,)),
          SizedBox(height: 20,),
          InkWell(
            onTap: (){
              itemClick(MenuItem.Categories);
            },
            child: Row(
              children: [
                Icon(
                  Icons.list,
                ),
                SizedBox(width: 10,),
                Text(
                  "Categories",
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            ),
          ),
          SizedBox(height: 10,),
          InkWell(
            onTap: (){
              itemClick(MenuItem.Settings);
            },
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                ),
                SizedBox(width: 10,),
                Text(
                  "Settings",
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum  MenuItem{
  Categories,
  Settings
}