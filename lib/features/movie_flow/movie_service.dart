import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_rating_app_flutter/features/movie_flow/genre/genre.dart';
import 'package:movies_rating_app_flutter/features/movie_flow/movie_repository.dart';
import 'package:movies_rating_app_flutter/features/movie_flow/result/movie.dart';

final movieServiceProvider = Provider<MovieService>((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return TMDBMovieService(movieRepository);
});

abstract class MovieService {
  Future<List<Genre>> getGenres();
  Future<Movie> getRecommendedMovie(
      int rating, int yearsBack, List<Genre> genres,
      [DateTime? yearBackFromDate]);
}

class TMDBMovieService implements MovieService {
  final MovieRepository _movieRepository;

  TMDBMovieService(this._movieRepository);

  @override
  Future<List<Genre>> getGenres() async {
    final genreEntities = await _movieRepository.getMoviesGenres();
    final genres = genreEntities.map((e) => Genre.fromEntity(e)).toList();
    return genres;
  }

  @override
  Future<Movie> getRecommendedMovie(
      int rating, int yearsBack, List<Genre> genres,
      [DateTime? yearBackFromDate]) async {
    final date = yearBackFromDate ?? DateTime.now();
    final year = date.year - yearsBack;
    final genreIds = genres.map((e) => e.id).toList().join(',');

    final movieEntities = await _movieRepository.getRecommendedMovies(
        rating.toDouble(), '$year-01-01', genreIds);

    final rnd = Random();
    // Map entities to Movie models
    final movies =
        movieEntities.map((e) => Movie.fromEntity(e, genres)).toList();
    final randomMovie = movies[rnd.nextInt(movies.length)];

    return randomMovie;
  }
}
