import 'package:flutter/material.dart';
import 'package:news_c10_maadi/model/category_model.dart';
import 'package:news_c10_maadi/shared/app_colors.dart';

import 'category_widget.dart';

typedef onCategoryClick = void Function(CategoryModel categoryModel);
class CategoriesWidget extends StatelessWidget {
  CategoriesWidget({Key? key,required this.categoryClick}) : super(key: key);
  onCategoryClick categoryClick;
  List<CategoryModel> categories = CategoryModel.getAllCategories();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pick your category \nof interest",
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: AppColors.pickCategoryColor,
              fontSize: 22
            ),
          ),
          Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context , index)=>InkWell(
                    onTap: (){
                      categoryClick(categories[index]);
                    },
                    child: CategoryWidget(
                      index: index,
                      categoryModel: categories[index],
                    ),
                  )
              )
          )
        ],
      ),
    );
  }
}
