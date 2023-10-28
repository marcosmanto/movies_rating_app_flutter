import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_rating_app_flutter/core/constants.dart';
import 'package:movies_rating_app_flutter/core/widgets/primary_button.dart';
import 'package:movies_rating_app_flutter/features/movie_flow/genre/list_card.dart';
import 'package:movies_rating_app_flutter/features/movie_flow/movie_flow_controller.dart';

class GenreScreen extends ConsumerWidget {
  const GenreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            onPressed:
                ref.read(movieFlowControllerProvider.notifier).previousPage),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'Let\'s start with a genre',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: kListItemSpacing),
                itemBuilder: (context, index) {
                  final genre =
                      ref.watch(movieFlowControllerProvider).genres[index];
                  return ListCard(
                    genre: genre,
                    onTap: () => ref
                        .watch(movieFlowControllerProvider.notifier)
                        .toggleSelected(genre),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: kListItemSpacing,
                ),
                itemCount: ref.watch(movieFlowControllerProvider).genres.length,
              ),
            ),
            PrimaryButton(
              onPressed:
                  ref.read(movieFlowControllerProvider.notifier).nextPage,
              text: 'Continue',
            ),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
