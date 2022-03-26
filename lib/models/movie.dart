class Movie {
  final int id;
  final String posterPath;
  final String backdropPath;
  final String title;
  final String overview;
  final String releaseDate;
  final List<dynamic> genreIds;
  final bool video;

  Movie({
    required this.id,
    required this.posterPath,
    required this.backdropPath,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.genreIds,
    required this.video,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      posterPath: 'https://image.tmdb.org/t/p/w400' + json['poster_path'],
      backdropPath: 'https://image.tmdb.org/t/p/original' + json['backdrop_path'],
      title: json['title'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      genreIds: json['genre_ids'],
      video: json['video'],
    );
  }
}
