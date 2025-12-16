import 'package:cinetopia/app/models/movie.dart';
import 'package:cinetopia/app/services/search_for_movie_service.dart';
import 'package:cinetopia/app/services/search_movies_service.dart';
import 'package:cinetopia/app/services/search_popular_movies_service.dart';
import 'package:cinetopia/app/services/search_released_movies_service.dart';

class SearchMoviesViewmodel {
  List<Movie> _movieList = <Movie>[];

  Future<List<Movie>> getPopularMovies() async{
    final SearchMoviesService service = SearchPopularMoviesService();
    _movieList = await service.getMovies();
    return _movieList;
  }

  Future<List<Movie>> getReleasedMovies() async{
    final SearchMoviesService service = SearchReleasedMoviesService();
    _movieList = await service.getMovies();
    return _movieList;
  }

  Future<List<Movie>> getMovie(String query) async{
    if(query.isEmpty){
      _movieList = await getPopularMovies();
    }
    else {
      final SearchMoviesService service = SearchForMovieService(query: query);
      _movieList = await service.getMovies();
    }    
    return _movieList;  
  }

  List<Movie> get moviesList => _movieList;
}