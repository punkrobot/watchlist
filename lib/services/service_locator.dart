import 'package:get_it/get_it.dart';
import 'package:watchlist/features/movie_list/data/movie_repository.dart';
import 'package:watchlist/features/movie_list/data/movie_service.dart';
import 'package:watchlist/services/shared_prefs_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerSingleton(SharedPrefsService()..init());

  locator.registerSingleton(MovieService()..init());

  locator.registerSingleton(MovieRepository(
    locator<MovieService>(),
    locator<SharedPrefsService>(),
  ));
}
