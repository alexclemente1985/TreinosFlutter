import 'package:flutter/material.dart';
import 'package:hyrule_app/screens/results.dart';
import 'package:hyrule_app/utils/consts/categories.dart';

class Category extends StatelessWidget {
  const Category({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) => Results(category: category,)));
          },
          child: Ink(child: Center(
            child: Image.asset("$imagePath$category.png"),
          ),),
        ),
        Text(categories[category]!)
      ],
    );
  }
}