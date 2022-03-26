class MovieDetails {
  final int? runtime;

  MovieDetails({this.runtime});

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(runtime: json['runtime']);
  }
}
