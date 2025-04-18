import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vesti_assessment_app/presentation/pages/dashboard/home_page.dart';

void main() {
  testWidgets('HomePage displays sections and book lists', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: HomePage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Welcome Back!'), findsOneWidget);
    expect(find.text('Mark Edwards'), findsOneWidget);
    expect(find.text('Category'), findsOneWidget);
    expect(find.text('Recently Borrowed'), findsOneWidget);
    expect(find.text('New Arrival'), findsOneWidget);
    expect(find.text('Recommended For You'), findsOneWidget);
    expect(find.byType(ListView), findsNWidgets(3));
    expect(find.byType(GestureDetector), findsWidgets);
  });
}
