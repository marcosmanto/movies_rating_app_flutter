import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_rating_app_flutter/features/movie_flow/genre/genre_screen.dart';
import 'package:movies_rating_app_flutter/features/movie_flow/landing/landing_screen.dart';
import 'package:movies_rating_app_flutter/features/movie_flow/movie_flow_controller.dart';
import 'package:movies_rating_app_flutter/features/movie_flow/rating/rating_screen.dart';
import 'package:movies_rating_app_flutter/features/movie_flow/years_back/years_back_screen.dart';

class MovieFlow extends ConsumerWidget {
  const MovieFlow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageView(
      controller: ref.watch(movieFlowControllerProvider).pageController,
      //physics: const NeverScrollableScrollPhysics(),
      children: [
        LandingScreen(),
        GenreScreen(),
        RatingScreen(),
        YearsBackScreen(),
      ],
    );
  }
}
