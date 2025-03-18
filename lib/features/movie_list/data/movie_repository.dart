import 'package:watchlist/features/movie_list/data/movie_service.dart';
import 'package:watchlist/features/movie_list/domain/models/genre.dart';
import 'package:watchlist/features/movie_list/domain/models/movie.dart';

class MovieRepository {
  late MovieService movieService;

  MovieRepository(this.movieService);

  final _imagePath = 'https://image.tmdb.org/t/p/w500';

  Future<List<Movie>> listMovies() async {
    final genres = await movieService.listGenres();

    final moviesResult = await movieService.listMovies();

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
              poster: e.poster != null ? '$imagePath${e.poster}' : '',
              poster: e.poster != null ? '$_imagePath${e.poster}' : '',
            ))
        .toList();
  }
}
