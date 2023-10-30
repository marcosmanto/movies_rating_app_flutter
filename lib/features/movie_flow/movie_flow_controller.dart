import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_rating_app_flutter/features/movie_flow/genre/genre.dart';
import 'package:movies_rating_app_flutter/features/movie_flow/movie_flow_state.dart';
import 'package:movies_rating_app_flutter/features/movie_flow/movie_service.dart';
import 'package:movies_rating_app_flutter/features/movie_flow/result/movie.dart';

// Provide the controller and state to entire application
final movieFlowControllerProvider =
    StateNotifierProvider.autoDispose<MovieFlowController, MovieFlowState>(
  (ref) {
    return MovieFlowController(
      MovieFlowState(
        pageController: PageController(),
        movie: AsyncValue.data(Movie.initial()),
        genres: const AsyncValue.data([]),
      ),
      ref.watch(movieServiceProvider),
    );
  },
);

class MovieFlowController extends StateNotifier<MovieFlowState> {
  final MovieService _movieService;

  MovieFlowController(MovieFlowState state, this._movieService) : super(state) {
    loadGenres();
  }

  Future<void> loadGenres() async {
    state = state.copyWith(genres: const AsyncValue.loading());
    final result = await _movieService.getGenres();

    result.when(
      (genres) {
        final updatedGenres = AsyncValue.data(genres);
        state = state.copyWith(genres: updatedGenres);
      },
      (error) {
        state =
            state.copyWith(genres: AsyncValue.error(error, StackTrace.current));
      },
    );
  }

  Future<void> getRecommendedMovie() async {
    state = state.copyWith(movie: const AsyncValue.loading());
    final selectedGenres = state.genres.asData?.value
            .where((e) => e.isSelected == true)
            .toList(growable: false) ??
        [];

    final result = await _movieService.getRecommendedMovie(
      state.rating,
      state.yearsBack,
      selectedGenres,
    );

    result.when(
      (movie) => state = state.copyWith(movie: AsyncValue.data(movie)),
      (error) => state =
          state.copyWith(movie: AsyncValue.error(error, StackTrace.current)),
    );
  }

  void toggleSelected(Genre genre) {
    state = state.copyWith(
      genres: AsyncValue.data([
        for (final oldGenre in state.genres.asData!.value)
          if (oldGenre == genre) oldGenre.toggleSelected() else oldGenre
      ]),
    );
  }

  void updateRating(int updatedRating) {
    state = state.copyWith(rating: updatedRating < 0 ? 0 : updatedRating);
  }

  void updateYearsBack(int updatedYearsBack) {
    state =
        state.copyWith(yearsBack: updatedYearsBack < 0 ? 0 : updatedYearsBack);
  }

  void nextPage() {
    if (state.pageController.page! >= 1) {
      // Guard clause to avoid navigating forward if user doesn't select any genre
      if (!state.genres.asData!.value
          .any((genre) => genre.isSelected == true)) {
        return;
      }
    }

    state.pageController.nextPage(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
    );
  }

  void previousPage() {
    state.pageController.previousPage(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    state.pageController.dispose();
    super.dispose();
  }
}
