import 'package:flutter/material.dart';
import 'package:hyrule_app/controllers/api_controller.dart';
import 'package:hyrule_app/screens/components/entry_card.dart';
import 'package:hyrule_app/screens/favorites.dart';

class Results extends StatelessWidget {
  Results({super.key, required this.category});
  final String category;

  final ApiController apiController = ApiController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(category),
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
          ]
        ),
        
        body: FutureBuilder(
          future: apiController.getEntriesByCategory(category: category), 
          builder: (context, snapshot){
            switch (snapshot.connectionState){
              case ConnectionState.active:
              case ConnectionState.none:
                break;
              case ConnectionState.done:
                if(snapshot.hasData){
                  return ListView.builder(
                    itemBuilder: (context, index) => EntryCard(entry: snapshot.data![index], isSaved: false),
                    itemCount: snapshot.data!.length,
                  );
                }
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator(),);
              }
              return Container();
          }
        ),
      )
    );
  }
}