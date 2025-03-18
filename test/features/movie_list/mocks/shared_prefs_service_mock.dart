import 'package:mockito/mockito.dart';
import 'package:watchlist/services/shared_prefs_service.dart';

class SharedPrefsServiceMock extends Mock implements SharedPrefsService {
  @override
  List<int> getWatchlistIds() {
    return [1];
  }

  @override
  Future<bool> addWatchlistId(int id) async {
    return Future.value(true);
  }

  @override
  Future<bool> removeWatchlistId(int id) async {
    return Future.value(true);
  }
}
