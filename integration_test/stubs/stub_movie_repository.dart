import 'package:movies_rating_app_flutter/features/movie_flow/genre/genre_entity.dart';
import 'package:movies_rating_app_flutter/features/movie_flow/movie_repository.dart';
import 'package:movies_rating_app_flutter/features/movie_flow/result/movie_entity.dart';

class StubMovieRepository implements MovieRepository {
  @override
  Future<List<GenreEntity>> getMoviesGenres() {
    return Future.value([const GenreEntity(id: 1, name: 'Animation')]);
  }

  @override
  Future<List<MovieEntity>> getRecommendedMovies(
      double rating, String date, String genreIds) {
    return Future.value([
      const MovieEntity(
        title: 'Lilo & Stich',
        overview: 'Some interesting story',
        voteAverage: 7.3,
        genreIds: [1, 2, 3],
        releaseDate: '2002-06-16',
      ),
    ]);
  }
}
