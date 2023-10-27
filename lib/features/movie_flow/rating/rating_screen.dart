import 'package:flutter/material.dart';
import 'package:movies_rating_app_flutter/core/constants.dart';
import 'package:movies_rating_app_flutter/core/widgets/primary_button.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen(
      {super.key, required this.nextPage, required this.previousPage});

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double rating = 5;

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
              'Select a minimum rating\nranging from 1-10',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  rating.ceil().toString(),
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
              value: rating,
              onChanged: (value) => setState(() => rating = value),
              min: 1,
              max: 10,
              divisions: 9,
              label: rating.ceil().toString(),
            ),
            const Spacer(),
            PrimaryButton(onPressed: widget.nextPage, text: 'Yes please'),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
