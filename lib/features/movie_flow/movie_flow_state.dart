import 'package:flutter/material.dart';
import 'package:movies_rating_app_flutter/features/movie_flow/genre/genre.dart';
import 'package:movies_rating_app_flutter/features/movie_flow/result/movie.dart';

const movieMock = Movie(
  title: 'The Hulk',
  overview:
      'Bruce Banner, a genetics researcher with a tragic past, suffers an accident that causes hom to transform into a raging green monster when he gets angry.',
  voteAverage: 4.8,
  genres: [Genre(name: 'Action'), Genre(name: 'Fantasy')],
  releaseDate: '2019-05-24',
  backdropPath: '',
  posterPath: '',
);

const List<Genre> genresMock = [
  Genre(name: 'Action'),
  Genre(name: 'Comedy'),
  Genre(name: 'Horror'),
  Genre(name: 'Anime'),
  Genre(name: 'Drama'),
  Genre(name: 'Family'),
  Genre(name: 'Romance'),
];

@immutable
class MovieFlowState {
  final PageController pageController;
  final int rating;
  final int yearsBack;
  final List<Genre> genres;
  final Movie movie;

  MovieFlowState({
    required this.pageController,
    this.movie = movieMock,
    this.genres = genresMock,
    this.rating = 5,
    this.yearsBack = 10,
  });

  MovieFlowState copyWith({
    PageController? pageController,
    int? rating,
    int? yearsBack,
    List<Genre>? genres,
    Movie? movie,
  }) {
    return MovieFlowState(
      pageController: pageController ?? this.pageController,
      rating: rating ?? this.rating,
      yearsBack: yearsBack ?? this.yearsBack,
      genres: genres ?? this.genres,
      movie: movie ?? this.movie,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieFlowState &&
        other.pageController == pageController &&
        other.rating == rating &&
        other.yearsBack == yearsBack &&
        other.genres == genres &&
        other.movie == movie;
  }

  @override
  int get hashCode {
    return pageController.hashCode ^
        rating.hashCode ^
        yearsBack.hashCode ^
        genres.hashCode ^
        movie.hashCode;
  }
}
