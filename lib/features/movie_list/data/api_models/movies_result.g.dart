// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesResult _$MoviesResultFromJson(Map<String, dynamic> json) => MoviesResult(
      page: (json['page'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoviesResultToJson(MoviesResult instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };
