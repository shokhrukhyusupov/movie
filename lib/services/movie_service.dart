import 'package:dio/dio.dart';

import '../models/movie.dart';

class MovieService {
  final Dio _dio = Dio();

  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = '150ee43f438c7d19de7b4a405379e443';

  Future<List<Movie>> getMovieNowPlaying() async {
    try {
      final response = await _dio.get('$baseUrl/movie/now_playing?',
          queryParameters: {'api_key': apiKey, 'language': 'en-US', 'page': 1});
      var movies = response.data['results'] as List;
      List<Movie> movieList = movies.map((e) => Movie.fromJson(e)).toList();
      return movieList;
    } catch (e) {
      throw Exception(e);
    }
  }
}
