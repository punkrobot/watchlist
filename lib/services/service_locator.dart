import 'package:get_it/get_it.dart';
import 'package:watchlist/features/movie_list/data/movie_repository.dart';
import 'package:watchlist/features/movie_list/data/movie_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerSingleton(MovieService()..init());

  locator.registerSingleton(MovieRepository(
    locator<MovieService>(),
  ));
}
