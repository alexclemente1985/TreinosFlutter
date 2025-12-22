import 'package:flutter/material.dart';
import 'package:hyrule_app/screens/favorites.dart';
import 'package:hyrule_app/utils/consts/categories.dart';
import 'package:hyrule_app/screens/components/category.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Escolha uma categoria"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Favorites()
                  )
                );
            },
            icon: Icon(Icons.bookmark))
          ],
        ),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16
          ),
          children: categories.keys.map((e) => Category(category: e)).toList()
          ,
          ),
      )
      );
  }
}