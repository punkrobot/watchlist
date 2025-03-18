import 'package:flutter/material.dart';
import 'package:watchlist/features/movie_list/domain/models/movie.dart';

class MovieListItem extends StatelessWidget {
  final Movie movie;

  const MovieListItem({
    super.key,
    required this.movie,
  });

  @override
  Widget build(Object context) {
    const textStyle = TextStyle(color: Colors.white, fontSize: 16);

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Hero(
            tag: 'movie-${movie.id}-poster',
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                image: DecorationImage(
                  image: NetworkImage(movie.poster),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withAlpha(80),
                    BlendMode.srcOver,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            height: 600,
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'movie-${movie.id}-title',
                  child: Text(
                    movie.title,
                    overflow: TextOverflow.fade,
                    style: textStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
