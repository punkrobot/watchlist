import 'package:flutter/material.dart';
import 'package:watchlist/features/movie_list/presentation/movie_list/movies_list_view.dart';
import 'package:watchlist/services/log.dart';
import 'package:watchlist/services/service_locator.dart';

void main() {
  Log.init();

  setupLocator();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Watchlist',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: const MoviesListView(),
      ),
    );
  }
}
