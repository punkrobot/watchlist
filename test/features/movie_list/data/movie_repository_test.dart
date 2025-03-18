import 'package:test/test.dart';
import 'package:watchlist/features/movie_list/data/movie_repository.dart';
import 'package:watchlist/features/movie_list/data/movie_service.dart';
import 'package:watchlist/services/service_locator.dart';

import '../mocks/movies_service_mock.dart';

void main() {
  setUpAll(() async {
    locator.registerSingleton<MovieService>(MovieServiceMock());
  });

  group('Movie Repository', () {
    test('movie model api to domain model conversion', () async {
      final repository = MovieRepository(
        locator<MovieService>(),
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
      );

      final movies = await repository.listMovies();

      expect(movies.first.genres.first.name, 'Drama');
      expect(movies.first.genres[1].name, 'Comedy');
    });
  });
}
