import 'package:dio/dio.dart';
import 'package:watchlist/features/movie_list/data/api_models/genre.dart';
import 'package:watchlist/features/movie_list/data/api_models/movies_result.dart';
import 'package:watchlist/services/network/rest_client.dart';

class MovieService {
  late RestClient _client;

  void init() {
    final dio = Dio();

    dio.options.headers['Authorization'] =
        'Bearer ${const String.fromEnvironment('TMDB_TOKEN')}';

    _client = RestClient(dio);
  }

  Future<MoviesResult> listMovies() async {
    final result = await _client.getPopularMovies();

    return result;
  }

  Future<List<Genre>> listGenres() async {
    final result = await _client.getGenres();

    return result.genres;
  }
}
