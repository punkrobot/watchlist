import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:watchlist/features/movie_list/data/api_models/genres_result.dart';
import 'package:watchlist/features/movie_list/data/api_models/movies_result.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://api.themoviedb.org/3/')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET('/movie/now_playing?language=es-MX&page=1&region=MX')
  Future<MoviesResult> getPopularMovies();

  @GET('/genre/movie/list?language=es')
  Future<GenresResult> getGenres();
}
