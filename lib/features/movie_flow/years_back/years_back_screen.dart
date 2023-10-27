import 'package:flutter/material.dart';
import 'package:movies_rating_app_flutter/core/constants.dart';
import 'package:movies_rating_app_flutter/core/widgets/primary_button.dart';

class YearsBackScreen extends StatefulWidget {
  const YearsBackScreen(
      {super.key, required this.nextPage, required this.previousPage});

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  State<YearsBackScreen> createState() => _YearsBackScreenState();
}

class _YearsBackScreenState extends State<YearsBackScreen> {
  double yearsBack = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: widget.previousPage),
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
                  yearsBack.ceil().toString(),
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
              value: yearsBack,
              onChanged: (value) => setState(() => yearsBack = value),
              min: 0,
              max: 70,
              divisions: 69,
              label: yearsBack.ceil().toString(),
            ),
            const Spacer(),
            PrimaryButton(onPressed: widget.nextPage, text: 'Amazing'),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
