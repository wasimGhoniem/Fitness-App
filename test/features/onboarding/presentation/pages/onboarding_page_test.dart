import 'package:fitness_app/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:fitness_app/features/onboarding/presentation/widgets/dot_indecator.dart';
import 'package:fitness_app/features/onboarding/presentation/widgets/onboarding_details_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Mock classes
class MockSharedPreferences extends Mock implements SharedPreferences {}
class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  late MockNavigatorObserver mockNavigatorObserver;

  setUp(() {
    mockNavigatorObserver = MockNavigatorObserver();
  });

  // Helper function to create widget with necessary dependencies
  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: OnboardingPage(),
      navigatorObservers: [mockNavigatorObserver],
    );
  }

  group('OnboardingPage Widget Tests', () {
    testWidgets('should build without crashing', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.byType(OnboardingPage), findsOneWidget);
    });

    testWidgets('should display PageView with onboarding content',
            (WidgetTester tester) async {
          // Arrange & Act
          await tester.pumpWidget(createWidgetUnderTest());

          // Assert
          expect(find.byType(PageView), findsOneWidget);
          expect(find.byType(Image), findsAtLeast(1));
        });
  });
}