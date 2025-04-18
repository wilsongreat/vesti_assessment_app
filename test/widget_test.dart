import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vesti_assessment_app/presentation/pages/auth/onboard_screen.dart';

void main() {
  testWidgets('OnboardScreen shows title and Get Started button', (WidgetTester tester) async {
    // Pump the app
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: OnboardScreen(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Enjoy the Best Features'), findsOneWidget);

    expect(find.text('Get Started'), findsOneWidget);
  });
}
