import 'package:flutter/material.dart';
import 'package:movies_rating_app_flutter/core/constants.dart';
import 'package:movies_rating_app_flutter/core/widgets/primary_button.dart';
import 'package:movies_rating_app_flutter/features/movie_flow/genre/genre.dart';
import 'package:movies_rating_app_flutter/features/movie_flow/result/movie.dart';

class ResultScreen extends StatelessWidget {
  static route({bool fullscreenDialog = true}) => MaterialPageRoute(
        builder: (context) => const ResultScreen(),
      );
  const ResultScreen({super.key});

  final double movieHeight = 150;

  final movie = const Movie(
    title: 'The Hulk',
    overview:
        'Bruce Banner, a genetics researcher with a tragic past, suffers an accident that causes hom to transform into a raging green monster when he gets angry.',
    voteAverage: 4.8,
    genres: [Genre(name: 'Action'), Genre(name: 'Fantasy')],
    releaseDate: '2019-05-24',
    backdropPath: '',
    posterPath: '',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const CoverImage(),
                    Positioned(
                      width: MediaQuery.of(context).size.width,
                      bottom: -(movieHeight / 2),
                      child: MovieImageDetails(
                        movie: movie,
                        movieHeight: movieHeight,
                      ),
                    )
                  ],
                ),
                SizedBox(height: movieHeight / 2),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 22),
                  child: Text(
                    movie.overview,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                )
              ],
            ),
          ),
          PrimaryButton(
            onPressed: () => Navigator.of(context).pop(),
            text: 'Find another movie',
          ),
          const SizedBox(height: kMediumSpacing),
        ],
      ),
    );
  }
}

class CoverImage extends StatelessWidget {
  const CoverImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 298),
      child: ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).scaffoldBackgroundColor,
              Colors.transparent,
            ],
          ).createShader(
            Rect.fromLTRB(
              0,
              0,
              rect.width,
              rect.height,
            ),
          );
        },
        blendMode: BlendMode.dstIn,
        child: Placeholder(
          fallbackHeight: 298,
        ),
      ),
    );
  }
}

class MovieImageDetails extends StatelessWidget {
  const MovieImageDetails({
    super.key,
    required this.movie,
    required this.movieHeight,
  });

  final Movie movie;
  final double movieHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: movieHeight,
            child: const Placeholder(),
          ),
          const SizedBox(width: kMediumSpacing),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  movie.genresCommaSeparated,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Row(
                  children: [
                    Text(
                      '4.8',
                      style: TextStyle(
                        color: Colors.white.withOpacity(.62),
                      ),
                    ),
                    const Icon(
                      Icons.star_rounded,
                      size: 20,
                      color: Colors.amber,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
