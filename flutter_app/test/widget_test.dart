import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/main.dart';

// This file demonstrates the text scaling bug
// There is no overflow in `MyApp` when ran normally with `flutter run`
void main() {
  // fails when ran with 'flutter test'
  // passes when ran with 'flutter run test/widget_test.dart'
  testWidgets('Test layout', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
  });

  // passes when ran with 'flutter test'
  // passes when ran with 'flutter run test/widget_test.dart'
  testWidgets('Test layout with workaround', (WidgetTester tester) async {
    final TestWidgetsFlutterBinding binding =
        TestWidgetsFlutterBinding.ensureInitialized();
    binding.window.textScaleFactorTestValue = 0.49;

    await tester.pumpWidget(MyApp());
  });

  // passes when ran with 'flutter test'
  // passes when ran with 'flutter run test/widget_test.dart'
  testWidgets('Test layout with workaround, only when needed',
      (WidgetTester tester) async {
    final TestWidgetsFlutterBinding binding =
        TestWidgetsFlutterBinding.ensureInitialized();
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      binding.window.textScaleFactorTestValue = 0.49;
    }

    await tester.pumpWidget(MyApp());
  });
}
