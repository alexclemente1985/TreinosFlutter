import 'package:cinetopia/app/viewmodels/search_movies_viewmodel.dart';
import 'package:cinetopia/ui/components/movie_card.dart';
import 'package:flutter/material.dart';

class SearchMovies extends StatefulWidget {
  SearchMovies({super.key});

  @override
  State<SearchMovies> createState() => _SearchMoviesState();
}

class _SearchMoviesState extends State<SearchMovies> {
  //final SearchPopularMoviesService searchPopularMoviesService = SearchPopularMoviesService();
  final SearchMoviesViewmodel viewModel = SearchMoviesViewmodel();

  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Iniciando Search movies");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("Desativando Search movies"); //reduz consumo de memória ao trocar de tela, sem remover da árvore de widgets
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   print('Limpando recursos do Search movies');
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: viewModel.getMovie(textController.text), 
      builder: (context, snapshot){
        if(snapshot.hasData){
          return CustomScrollView(
      //opção que evita o erro de tamanho indefinido ao usar uma lista
      slivers: [
        //depende do encapsulamento de widgets em SliverToBoxAdapter
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Image.asset("assets/popular.png", height: 80, width: 80),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: Text(
              "Filmes Populares",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: 32),
            child: TextField(
              controller: textController,
              onEditingComplete: (){
                FocusScope.of(context).unfocus(); //quando clicar no enter vai tirar o foco da barra de busca
                setState(() {//Isto é apenas para dar um refresh na tela
                });
              },
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                label: Text("Pesquisar"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ),
        SliverList.builder(
          itemBuilder: (context, index) =>
              Padding(
                padding: EdgeInsets.only(bottom: 32), 
                child: viewModel.moviesList.isNotEmpty
                ? MovieCard(
                  movie: viewModel.moviesList[viewModel.moviesList.length > 1 ? index : 0]
                )
                : Center(child: Text("Nenhum filme encontrado..."),)
              ),
          itemCount: viewModel.moviesList.length > 1 ? 10 : 1,
        ),
      ],
    );}
    else {
      return Center(child: CircularProgressIndicator(),);
    }
        });
      }
}

