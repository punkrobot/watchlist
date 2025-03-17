import 'package:flutter/material.dart';
import 'package:watchlist/features/movie_list/domain/models/movie.dart';
import 'package:watchlist/features/movie_list/presentation/widgets/genre_label.dart';

class MovieListItem extends StatelessWidget {
  final Movie movie;

  const MovieListItem({
    super.key,
    required this.movie,
  });

  @override
  Widget build(Object context) {
    const textStyle = TextStyle(color: Colors.white, fontSize: 24);

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: 600,
        padding: const EdgeInsets.all(12),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(movie.title, style: textStyle),
            const SizedBox(height: 8),
            Row(
              children: [
                ...movie.genres.map(
                  (genre) => GenreLabel(genre: genre.name),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
