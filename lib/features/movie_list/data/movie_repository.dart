import 'package:watchlist/features/movie_list/data/movie_service.dart';
import 'package:watchlist/features/movie_list/domain/models/genre.dart';
import 'package:watchlist/features/movie_list/domain/models/movie.dart';

class MovieRepository {
  final imagePath = 'https://image.tmdb.org/t/p/w500';

  Future<List<Movie>> listMovies() async {
    final service = MovieService()..init();
    final genres = await service.listGenres();

    final moviesResult = await service.listMovies();

    return moviesResult.results
        .map((e) => Movie(
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
            ))
        .toList();
  }
}
