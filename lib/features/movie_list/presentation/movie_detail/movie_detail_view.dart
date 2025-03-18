import 'package:flutter/material.dart';
import 'package:watchlist/features/movie_list/domain/models/movie.dart';
import 'package:watchlist/features/movie_list/presentation/widgets/genre_label.dart';

class MovieDetailView extends StatelessWidget {
  final Movie movie;

  const MovieDetailView({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Colors.white, fontSize: 24);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Hero(
                tag: 'movie-${movie.id}-poster',
                child: Container(
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
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      left: 16,
                      right: 32,
                      bottom: 18,
                    ),
                    child: Hero(
                      tag: 'movie-${movie.id}-title',
                      child: Text(
                        movie.title,
                        style: textStyle.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      movie.overview,
                      style: textStyle.copyWith(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 24,
                      left: 16,
                      right: 50,
                      bottom: 36,
                    ),
                    child: Wrap(
                      children: [
                        ...movie.genres.map(
                          (genre) => GenreLabel(genre: genre.name),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
            Positioned(
              bottom: 28,
              right: 28,
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () => Navigator.of(context).pop(true),
                child: Icon(
                  movie.inWatchlist
                      ? Icons.remove_red_eye_rounded
                      : Icons.remove_red_eye_outlined,
                  color: Colors.black,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
