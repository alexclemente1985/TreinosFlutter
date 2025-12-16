import 'package:cinetopia/app/viewmodels/search_movies_viewmodel.dart';
import 'package:cinetopia/ui/components/movie_card.dart';
import 'package:flutter/material.dart';

class Releases extends StatelessWidget {
  final SearchMoviesViewmodel viewModel = SearchMoviesViewmodel();
  Releases({super.key});
  

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: viewModel.getReleasedMovies(), 
      builder: (builder, snapshot){
        if(snapshot.hasData){
          return CustomScrollView(
      //opção que evita o erro de tamanho indefinido ao usar uma lista
      slivers: [
        //depende do encapsulamento de widgets em SliverToBoxAdapter
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Image.asset("assets/upcoming.png", height: 80, width: 80),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: Text(
              "Próximos Lançamentos",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SliverList.builder(
          itemBuilder: (context, index) =>
              Padding(padding: EdgeInsets.only(bottom: 32), child: MovieCard(movie: viewModel.moviesList[index])),
          itemCount: 10,
        ),
      ],
    );
        }
        else {
          return Center(child: CircularProgressIndicator(),);
        }
      }
    );
  }
}