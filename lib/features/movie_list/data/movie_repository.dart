import 'package:watchlist/features/movie_list/data/movie_service.dart';
import 'package:watchlist/features/movie_list/domain/models/genre.dart';
import 'package:watchlist/features/movie_list/domain/models/movie.dart';
import 'package:watchlist/services/shared_prefs_service.dart';

class MovieRepository {
  late final MovieService _movieService;
  late final SharedPrefsService _sharedPrefsService;

  MovieRepository(this._movieService, this._sharedPrefsService);

  final _imagePath = 'https://image.tmdb.org/t/p/w500';

  Future<List<Movie>> listMovies() async {
    final genres = await _movieService.listGenres();

    final moviesResult = await _movieService.listMovies();

    final watchlist = _sharedPrefsService.getWatchlistIds();

    return moviesResult.results
        .map((e) => Movie(
              id: e.id,
              title: e.title,
              overview: e.overview,
              releaseDate: DateTime.parse(e.releaseDate),
              genres: e.genreIds
                  .map((id) => Genre(
                        id: id,
                        name: genres.firstWhere((g) => g.id == id).name,
                      ))
                  .toList(),
              poster: e.poster != null ? '$_imagePath${e.poster}' : '',
              inWatchlist: watchlist.contains(e.id),
            ))
        .toList();
  }

  void updateMovieWatchlistStatus(Movie movie) {
    final watchlist = _sharedPrefsService.getWatchlistIds();
    if (watchlist.contains(movie.id)) {
      _sharedPrefsService.removeWatchlistId(movie.id);
    } else {
      _sharedPrefsService.addWatchlistId(movie.id);
    }
  }
}
