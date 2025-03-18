import 'package:mockito/mockito.dart';
import 'package:watchlist/features/movie_list/data/api_models/genre.dart';
import 'package:watchlist/features/movie_list/data/api_models/movie.dart';
import 'package:watchlist/features/movie_list/data/api_models/movies_result.dart';
import 'package:watchlist/features/movie_list/data/movie_service.dart';

class MovieServiceMock extends Mock implements MovieService {
  @override
  Future<MoviesResult> listMovies() async {
    return Future.value(
      MoviesResult(
        page: 1,
        results: [
          Movie(
            id: 1,
            title: 'Test',
            overview: 'Overview',
            poster: '/test.jpg',
            releaseDate: '2025-01-01',
            genreIds: [1, 2],
          )
        ],
      ),
    );
  }

  @override
  Future<List<Genre>> listGenres() async {
    return [
      Genre(id: 1, name: 'Drama'),
      Genre(id: 2, name: 'Comedy'),
    ];
  }
}
