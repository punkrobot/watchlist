import 'package:watchlist/features/movie_list/domain/models/genre.dart';

class Movie {
  final int id;
  final String title;
  final String overview;
  final String poster;
  final DateTime releaseDate;
  final List<Genre> genres;
  final bool inWatchlist;

  Movie copyWith({
    int? id,
    String? title,
    String? overview,
    String? poster,
    DateTime? releaseDate,
    List<Genre>? genres,
    bool? inWatchlist,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      poster: poster ?? this.poster,
      releaseDate: releaseDate ?? this.releaseDate,
      genres: genres ?? this.genres,
      inWatchlist: inWatchlist ?? this.inWatchlist,
    );
  }

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.poster,
    required this.releaseDate,
    required this.genres,
    required this.inWatchlist,
  });
}
