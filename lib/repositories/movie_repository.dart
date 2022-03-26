import 'package:dio/dio.dart';
import 'package:movie/models/movie_details.dart';

import '../models/movie.dart';

class MovieRepository {
  static const String apiKey = "150ee43f438c7d19de7b4a405379e443";
  static const String baseUrl = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();

  Future<List<Movie>> getMovies(int page, String path) async {
    var params = {"api_key": apiKey, "language": "en-US", "page": page};
    var url = baseUrl + path;
    try {
      final response = await _dio.get(url, queryParameters: params);
      var results = response.data['results'] as List;
      var movies = results.map((e) => Movie.fromJson(e)).toList();
      return movies;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Movie>> getTv(int page, String path) async {
    var params = {"api_key": apiKey, "language": "en-US", "page": page};
    var url = baseUrl + path;
    try {
      final response = await _dio.get(url, queryParameters: params);
      var results = response.data['results'] as List;
      var movies = results.map((e) => Movie.fromJson(e)).toList();
      return movies;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<MovieDetails> getMovieDetails(String path) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    var url = baseUrl + path;
    try {
      final json =
          await _dio.get(url, queryParameters: params) as Map<String, dynamic>;
      final movieDetails = MovieDetails.fromJson(json);
      return movieDetails;
    } catch (e) {
      throw Exception(e);
    }
  }
}
