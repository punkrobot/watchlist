import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  late SharedPreferences _prefs;

  final String _watchlistIds = "watchlistIds";

  List<int> getWatchlistIds() {
    return _prefs
            .getStringList(_watchlistIds)
            ?.map((e) => int.parse(e))
            .toList() ??
        [];
  }

  Future<bool> addWatchlistId(int id) async {
    final watchlist = getWatchlistIds();
    watchlist.add(id);

    return _setOrRemove(
      _watchlistIds,
      watchlist.map((e) => e.toString()).toList(),
    );
  }

  Future<bool> removeWatchlistId(int id) async {
    final watchlist = getWatchlistIds();
    watchlist.remove(id);

    return _setOrRemove(
      _watchlistIds,
      watchlist.map((e) => e.toString()).toList(),
    );
  }

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> _setOrRemove(
    String key,
    dynamic value,
  ) {
    if (value == null) {
      return _prefs.remove(key);
    }
    if (value is bool) {
      return _prefs.setBool(key, value);
    }
    if (value is double) {
      return _prefs.setDouble(key, value);
    }
    if (value is int) {
      return _prefs.setInt(key, value);
    }
    if (value is String) {
      return _prefs.setString(key, value);
    }
    if (value is List<String>) {
      return _prefs.setStringList(key, value);
    }
    return Future.value(false);
  }
}
