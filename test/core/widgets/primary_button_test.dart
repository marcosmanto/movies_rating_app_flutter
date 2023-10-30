import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_rating_app_flutter/core/widgets/primary_button.dart';

void main() {
  testWidgets(
      'Given primary button When loading is true Then find progress indicator',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: PrimaryButton(
          onPressed: () {},
          text: '',
          isLoading: true,
        ),
      ),
    );

    final loadingIndicatorFinder = find.byType(CircularProgressIndicator);

    expect(loadingIndicatorFinder, findsOneWidget);
  });

  testWidgets(
      'Given primary button When loading is false Then finds no progress indicator',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: PrimaryButton(
          onPressed: () {},
          text: 'test',
          isLoading: false,
        ),
      ),
    );

    final loadingIndicatorFinder = find.byType(CircularProgressIndicator);

    expect(loadingIndicatorFinder, findsNothing);
    expect(find.text('test'), findsOneWidget);
  });
}
