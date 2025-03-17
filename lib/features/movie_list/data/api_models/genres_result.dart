import 'package:json_annotation/json_annotation.dart';
import 'package:watchlist/features/movie_list/data/api_models/genre.dart';

part 'genres_result.g.dart';

@JsonSerializable()
class GenresResult {
  final List<Genre> genres;

  GenresResult({
    required this.genres,
  });

  factory GenresResult.fromJson(Map<String, dynamic> json) =>
      _$GenresResultFromJson(json);
  Map<String, dynamic> toJson() => _$GenresResultToJson(this);
}
