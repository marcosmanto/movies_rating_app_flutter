import 'package:flutter/material.dart';
import 'package:movies_rating_app_flutter/core/constants.dart';
import 'package:movies_rating_app_flutter/core/widgets/primary_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({
    super.key,
    required this.nextPage,
    required this.previousPage,
  });

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'Let\'s find a movie',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Spacer(),
            Image.asset('assets/images/cat.png'),
            Spacer(),
            PrimaryButton(
              onPressed: nextPage,
              text: 'Get Started',
            ),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
