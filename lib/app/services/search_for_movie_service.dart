import 'dart:convert';

import 'package:cinetopia/app/helpers/consts.dart';
import 'package:cinetopia/app/models/movie.dart';
import 'package:cinetopia/app/services/search_movies_service.dart';
import 'package:http/http.dart' as http;

class SearchForMovieService implements SearchMoviesService {
  List<Movie> movies = <Movie>[];
  final String query;

  SearchForMovieService({required this.query});

  @override
  Future<List<Movie>> getMovies() async {
    try{
      final response = await http.get(
        Uri.parse(moviePrefixUrl + query + movieFilterSuffix),
        headers: requestHeader
      );

      if(response.statusCode == 200){
        for(dynamic movie in json.decode(response.body)['results']){
          movies.add(Movie.fromMap(movie));
        }

        for(Movie movie in movies){
          print(movie.title);
        }
      }
      else{
        throw Exception(response.body);
      }

      return movies;
    }
    catch (e){
      print("Erro: ${e}");
      return movies;
    }
  }
}