import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_rating_app_flutter/core/environment_variables.dart';
import 'package:movies_rating_app_flutter/features/movie_flow/genre/genre_entity.dart';
import 'package:movies_rating_app_flutter/features/movie_flow/result/movie_entity.dart';
import 'package:movies_rating_app_flutter/main.dart';

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final dio = ref.read(dioProvider);
  return TMDBMovieRepository(dio: dio);
});

abstract class MovieRepository {
  Future<List<GenreEntity>> getMoviesGenres();
  Future<List<MovieEntity>> getRecommendedMovies(
      double rating, String date, String genreIds);
}

class TMDBMovieRepository implements MovieRepository {
  final Dio dio;

  TMDBMovieRepository({required this.dio});

  @override
  Future<List<GenreEntity>> getMoviesGenres() async {
    final response = await dio.get(
      'genre/movie/list',
      queryParameters: {
        'api_key': api,
        'language': 'en-US',
      },
    );

    final results = List<Map<String, dynamic>>.from(response.data['genres']);
    final genres = results.map((e) => GenreEntity.fromMap(e)).toList();
    return genres;
  }

  @override
  Future<List<MovieEntity>> getRecommendedMovies(
      double rating, String date, String genreIds) async {
    final response = await dio.get(
      'discover/movie',
      queryParameters: {
        'api_key': api,
        'language': 'en-US',
        'sort_by': 'popularity.desc',
        'include_adult': false,
        'vote_average.gte': rating,
        'page': 1,
        'primary_release_year': date.substring(0, 4),
        //'release_date.lte': date,
        'with_genres': genreIds,
      },
    );

    final results = List<Map<String, dynamic>>.from(response.data['results']);
    final List<MovieEntity> movies =
        results.map((e) => MovieEntity.fromMap(e)).toList();

    return movies;
  }
}
