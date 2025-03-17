// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenresResult _$GenresResultFromJson(Map<String, dynamic> json) => GenresResult(
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GenresResultToJson(GenresResult instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };
