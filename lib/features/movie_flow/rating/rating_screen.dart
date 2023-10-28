import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_rating_app_flutter/core/constants.dart';
import 'package:movies_rating_app_flutter/core/widgets/primary_button.dart';
import 'package:movies_rating_app_flutter/features/movie_flow/movie_flow_controller.dart';

class RatingScreen extends ConsumerWidget {
  const RatingScreen({super.key});

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
              'Select a minimum rating\nranging from 1-10',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ref.read(movieFlowControllerProvider).rating.toString(),
                  style: TextStyle(
                    fontSize: 45,
                  ),
                ),
                const Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                  size: 62,
                )
              ],
            ),
            const SizedBox(height: 55),
            Slider(
              value: ref.read(movieFlowControllerProvider).rating.toDouble(),
              onChanged: (value) => ref
                  .read(movieFlowControllerProvider.notifier)
                  .updateRating(value.toInt()),
              min: 1,
              max: 10,
              divisions: 9,
              label: ref.read(movieFlowControllerProvider).rating.toString(),
            ),
            const Spacer(),
            PrimaryButton(
                onPressed:
                    ref.read(movieFlowControllerProvider.notifier).nextPage,
                text: 'Yes please'),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
