import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist/features/movie_list/presentation/movies_list_cubit.dart';
import 'package:watchlist/features/movie_list/presentation/movies_list_state.dart';

class MoviesListView extends StatelessWidget {
  const MoviesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesListCubit()..loadMovies(),
      child: BlocBuilder<MoviesListCubit, MoviesListState>(
        builder: (context, state) {
          final cubit = context.read<MoviesListCubit>();
          if (!cubit.state.isLoading && cubit.state.movies.isNotEmpty) {
            return Column(
              children: [
                Text("Movie: ${cubit.state.movies[0].title}"),
                Text("Overview: ${cubit.state.movies[0].overview}"),
                Text("Release: ${cubit.state.movies[0].releaseDate}"),
                Text("Poster: ${cubit.state.movies[0].poster}"),
                Text("Genre: ${cubit.state.movies[0].genres[0].name}"),
              ],
            );
          } else {
            return const Text('Loading...');
          }
        },
      ),
    );
  }
}
