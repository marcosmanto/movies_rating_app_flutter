import 'package:flutter/material.dart';
import 'package:movies_rating_app_flutter/core/constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.width = double.infinity,
  });

  final VoidCallback onPressed;
  final String text;
  final bool isLoading;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius / 2),
          ),
          fixedSize: Size(width, 48),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onPrimary,
              )
            else
              Text(
                text,
                style: Theme.of(context).textTheme.labelLarge,
              )
          ],
        ),
      ),
    );
  }
}
