import 'package:cinetopia/api_key.dart';

const String popularMoviesUrl = "https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc";
const String moviePrefixUrl = "https://api.themoviedb.org/3/search/movie?query=";

const String releasedMoviesUrl = "https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1";

const String movieFilterSuffix = "&include_adult=false&language=en-US&page=1";
const String imageUrlPrefix = "https://image.tmdb.org/t/p/w500";

const requestHeader = {
  'Accept': 'application/json',
  'Authorization':  'Bearer $apiKey'
};