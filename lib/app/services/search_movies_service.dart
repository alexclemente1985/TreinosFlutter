import 'dart:convert';

import 'package:cinetopia/api_key.dart';
import 'package:cinetopia/app/helpers/consts.dart';
import 'package:cinetopia/app/models/movie.dart';
import 'package:http/http.dart' as http;


abstract class SearchMoviesService {
  Future<List<Movie>> getMovies();
}

