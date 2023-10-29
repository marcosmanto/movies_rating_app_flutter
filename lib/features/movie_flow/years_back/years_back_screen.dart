import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_rating_app_flutter/core/constants.dart';
import 'package:movies_rating_app_flutter/core/widgets/primary_button.dart';
import 'package:movies_rating_app_flutter/features/movie_flow/movie_flow_controller.dart';
import 'package:movies_rating_app_flutter/features/movie_flow/result/result_screen.dart';

class YearsBackScreen extends ConsumerWidget {
  const YearsBackScreen({super.key});

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
              'How many years back should\nwe check for?',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ref.read(movieFlowControllerProvider).yearsBack.toString(),
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -6,
                      height: .1),
                ),
                Text(
                  'Years back',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.color
                            ?.withOpacity(.62),
                      ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Slider(
              value: ref.read(movieFlowControllerProvider).yearsBack.toDouble(),
              onChanged: (value) => ref
                  .watch(movieFlowControllerProvider.notifier)
                  .updateYearsBack(value.toInt()),
              min: 0,
              max: 70,
              divisions: 69,
              label: ref.read(movieFlowControllerProvider).yearsBack.toString(),
            ),
            const Spacer(),
            PrimaryButton(
              onPressed: () {
                ref
                    .watch(movieFlowControllerProvider.notifier)
                    .getRecommendedMovie()
                    .then((_) =>
                        Navigator.of(context).push(ResultScreen.route()));
              },
              isLoading:
                  ref.watch(movieFlowControllerProvider).movie is AsyncLoading,
              text: 'Amazing',
            ),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
