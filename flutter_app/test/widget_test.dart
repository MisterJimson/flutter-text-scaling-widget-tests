import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/main.dart';

// This file demonstrates the text scaling bug
// There is no overflow in `MyApp` when ran normally with `flutter run`
void main() {
  String testText1 =
      "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||";
  String testText2 = "You have pushed the button this many times:";

  double textScaleFactorTestValue1 = 0.337;
  double textScaleFactorTestValue2 = 0.49;

  // fails when ran with 'flutter test'
  // passes when ran with 'flutter run test/widget_test.dart'
  testWidgets('Test layout 1', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(text: testText1));
  });

  // fails when ran with 'flutter test'
  // passes when ran with 'flutter run test/widget_test.dart'
  testWidgets('Test layout 2', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(text: testText2));
  });

  // passes when ran with 'flutter test'
  // passes when ran with 'flutter run test/widget_test.dart'
  testWidgets('Test layout 1 with workaround', (WidgetTester tester) async {
    final TestWidgetsFlutterBinding binding =
        TestWidgetsFlutterBinding.ensureInitialized();
    binding.window.textScaleFactorTestValue = textScaleFactorTestValue1;

    await tester.pumpWidget(MyApp(text: testText1));
  });

  // passes when ran with 'flutter test'
  // passes when ran with 'flutter run test/widget_test.dart'
  testWidgets('Test layout 2 with workaround', (WidgetTester tester) async {
    final TestWidgetsFlutterBinding binding =
        TestWidgetsFlutterBinding.ensureInitialized();
    binding.window.textScaleFactorTestValue = textScaleFactorTestValue2;

    await tester.pumpWidget(MyApp(text: testText2));
  });

  // passes when ran with 'flutter test'
  // passes when ran with 'flutter run test/widget_test.dart'
  testWidgets('Test layout 1 with workaround, only when needed',
      (WidgetTester tester) async {
    final TestWidgetsFlutterBinding binding =
        TestWidgetsFlutterBinding.ensureInitialized();
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      binding.window.textScaleFactorTestValue = textScaleFactorTestValue1;
    }

    await tester.pumpWidget(MyApp(text: testText1));
  });

  // passes when ran with 'flutter test'
  // passes when ran with 'flutter run test/widget_test.dart'
  testWidgets('Test layout 2 with workaround, only when needed',
      (WidgetTester tester) async {
    final TestWidgetsFlutterBinding binding =
        TestWidgetsFlutterBinding.ensureInitialized();
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      binding.window.textScaleFactorTestValue = textScaleFactorTestValue2;
    }

    await tester.pumpWidget(MyApp(text: testText2));
  });
}
