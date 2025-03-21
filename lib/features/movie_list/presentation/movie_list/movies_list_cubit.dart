import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist/features/movie_list/data/movie_repository.dart';
import 'package:watchlist/features/movie_list/domain/models/movie.dart';
import 'package:watchlist/features/movie_list/presentation/movie_list/movies_list_state.dart';
import 'package:watchlist/services/log.dart';
import 'package:watchlist/services/service_locator.dart';

class MoviesListCubit extends Cubit<MoviesListState> {
  MoviesListCubit() : super(MoviesListState.initial);

  void loadMovies() async {
    emit(state.copyWith(isLoading: true));

    Log.d('Loading...');

    final movies = await locator<MovieRepository>().listMovies();

    Log.d('Movies: ${movies.length}');

    emit(state.copyWith(
      isLoading: false,
      movies: movies,
    ));
  }

  void updateMovieWatchlistStatus(Movie movie) {
    locator<MovieRepository>().updateMovieWatchlistStatus(movie);

    final i = state.movies.indexWhere((e) => e.id == movie.id);
    state.movies[i] = state.movies[i].copyWith(inWatchlist: !movie.inWatchlist);

    emit(state.copyWith(
      movies: state.movies,
    ));
  }
}
