import 'package:flutter/material.dart';
import 'package:watchlist/features/movie_list/domain/models/movie.dart';
import 'package:watchlist/features/movie_list/presentation/movie_detail/movie_detail_view.dart';

class MovieDetailRoute extends MaterialPageRoute {
  MovieDetailRoute(Movie movie)
      : super(builder: (context) => MovieDetailView(movie: movie));

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(opacity: animation, child: child);
  }
}
