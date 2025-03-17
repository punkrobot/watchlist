import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist/features/movie_list/presentation/movies_list_cubit.dart';
import 'package:watchlist/features/movie_list/presentation/movies_list_state.dart';
import 'package:watchlist/features/movie_list/presentation/widgets/movie_list_item.dart';

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
            return ListView.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, index) => MovieListItem(
                movie: state.movies[index],
              ),
            );
          } else {
            return const Text('Loading...');
          }
        },
      ),
    );
  }
}
