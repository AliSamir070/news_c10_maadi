import 'package:flutter/material.dart';

import '../../data_layer/model/category_model.dart';

class CategoryWidget extends StatelessWidget {
  CategoryModel categoryModel;
  int index;
  CategoryWidget({Key? key,required this.categoryModel,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(8),
      decoration:BoxDecoration(
        color: categoryModel.color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
          bottomLeft: Radius.circular(index.isEven?0:24),
          bottomRight: Radius.circular(index.isEven?24:0)
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "assets/images/${categoryModel.imagePath}",
            height: height*0.1,
            fit: BoxFit.fitHeight,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            categoryModel.title,
            style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
