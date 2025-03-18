import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist/features/movie_list/presentation/movie_list/movies_list_cubit.dart';
import 'package:watchlist/features/movie_list/presentation/movie_list/movies_list_state.dart';
import 'package:watchlist/features/movie_list/presentation/widgets/movie_detail_route.dart';
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
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: state.movies.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () async {
                  final action = await Navigator.of(context).push(
                    MovieDetailRoute(state.movies[index]),
                  ) as bool?;

                  if (action == true) {
                    cubit.updateMovieWatchlistStatus(state.movies[index]);
                  }
                },
                child: MovieListItem(
                  movie: state.movies[index],
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
