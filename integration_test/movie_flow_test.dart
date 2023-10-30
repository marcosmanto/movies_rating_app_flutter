import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:movies_rating_app_flutter/core/widgets/primary_button.dart';
import 'package:movies_rating_app_flutter/features/movie_flow/movie_repository.dart';
import 'package:movies_rating_app_flutter/main.dart';

import 'stubs/stub_movie_repository.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('test basic flow and see the fake generated movie in the end',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          movieRepositoryProvider.overrideWithValue(StubMovieRepository())
        ],
        child: const MainApp(),
      ),
    );

    await tester.tap(find.byType(PrimaryButton));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Animation'));
    await tester.tap(find.byType(PrimaryButton));

    await tester.pumpAndSettle();
    await tester.tap(find.byType(PrimaryButton));

    await tester.pumpAndSettle();
    await tester.tap(find.byType(PrimaryButton));

    await tester.pumpAndSettle();
    expect(find.text('Lilo & Stich'), findsOneWidget);
  });

  testWidgets('Genre is needed to navigate forward', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          movieRepositoryProvider.overrideWithValue(StubMovieRepository())
        ],
        child: const MainApp(),
      ),
    );

    await tester.tap(find.byType(PrimaryButton));

    await tester.pumpAndSettle();

    await tester.tap(find.byType(PrimaryButton));

    expect(find.text('Animation'), findsOneWidget);
  });
}
