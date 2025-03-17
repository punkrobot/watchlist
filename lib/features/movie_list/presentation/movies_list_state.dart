import 'package:watchlist/features/movie_list/domain/models/movie.dart';

class MoviesListState {
  final List<Movie> movies;
  final bool isLoading;

  const MoviesListState({
    required this.movies,
    required this.isLoading,
  });

  static const MoviesListState initial = MoviesListState(
    movies: [],
    isLoading: true,
  );

  MoviesListState copyWith({
    List<Movie>? movies,
    bool? isLoading,
  }) {
    return MoviesListState(
      movies: movies ?? this.movies,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
