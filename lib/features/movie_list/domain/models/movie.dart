import 'package:watchlist/features/movie_list/domain/models/genre.dart';

class Movie {
  final int id;
  final String title;
  final String overview;
  final String poster;
  final DateTime releaseDate;
  final List<Genre> genres;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.poster,
    required this.releaseDate,
    required this.genres,
  });
}
