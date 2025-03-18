import 'package:test/test.dart';
import 'package:watchlist/features/movie_list/data/movie_repository.dart';
import 'package:watchlist/features/movie_list/data/movie_service.dart';
import 'package:watchlist/services/service_locator.dart';
import 'package:watchlist/services/shared_prefs_service.dart';

import '../mocks/movies_service_mock.dart';
import '../mocks/shared_prefs_service_mock.dart';

void main() {
  setUpAll(() async {
    locator.registerSingleton<MovieService>(MovieServiceMock());
    locator.registerSingleton<SharedPrefsService>(SharedPrefsServiceMock());
  });

  group('Movie Repository', () {
    test('movie model api to domain model conversion', () async {
      final repository = MovieRepository(
        locator<MovieService>(),
        locator<SharedPrefsService>(),
      );

      final movies = await repository.listMovies();

      expect(movies.first.title, 'Test');
      expect(movies.first.overview, 'Overview');
      expect(movies.first.releaseDate, DateTime(2025, 01, 01));
      expect(movies.first.poster, 'https://image.tmdb.org/t/p/w500/test.jpg');
    });

    test('movie model api to domain model genre mapping', () async {
      final repository = MovieRepository(
        locator<MovieService>(),
        locator<SharedPrefsService>(),
      );

      final movies = await repository.listMovies();

      expect(movies.first.genres.first.name, 'Drama');
      expect(movies.first.genres[1].name, 'Comedy');
    });

    test('movie model mapped to watchlist ', () async {
      final repository = MovieRepository(
        locator<MovieService>(),
        locator<SharedPrefsService>(),
      );

      final movies = await repository.listMovies();

      expect(movies[0].inWatchlist, true);
      expect(movies[1].inWatchlist, false);
    });
  });
}
