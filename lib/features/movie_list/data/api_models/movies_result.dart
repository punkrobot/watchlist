import 'package:json_annotation/json_annotation.dart';
import 'package:watchlist/features/movie_list/data/api_models/movie.dart';

part 'movies_result.g.dart';

@JsonSerializable()
class MoviesResult {
  final int page;
  final List<Movie> results;

  MoviesResult({
    required this.page,
    required this.results,
  });

  factory MoviesResult.fromJson(Map<String, dynamic> json) =>
      _$MoviesResultFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesResultToJson(this);
}
