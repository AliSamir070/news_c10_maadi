import 'package:flutter/material.dart';

class CategoryModel{
  String id;
  String title;
  String imagePath;
  Color color;
  CategoryModel({required this.id , required this.title , required this.imagePath,required this.color});

  static List<CategoryModel> getAllCategories()=>[
    CategoryModel(id: "sports", title: "Sports", imagePath: "sports.png", color: Color(0xffC91C22)),
    CategoryModel(id: "general",title: "General", imagePath: "Politics.png", color: Color(0xff003E90)),
    CategoryModel(id: "health",title: "Health", imagePath: "health.png", color: Color(0xffED1E79)),
    CategoryModel(id: "business",title: "Business", imagePath: "bussines.png", color: Color(0xffCF7E48)),
    CategoryModel(id: "technology",title: "Technology", imagePath: "technology.png", color: Color(0xff4882CF)),
    CategoryModel(id: "science",title: "Science", imagePath: "science.png", color: Color(0xffF2D352)),
  ];
}