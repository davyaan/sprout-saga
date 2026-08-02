import 'package:flutter_test/flutter_test.dart';

import 'package:sprout_saga/main.dart';

void main() {
  testWidgets('App boots to the home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const SproutSagaApp());
    await tester.pumpAndSettle();

    expect(find.text('Sprout Saga'), findsOneWidget);
  });
}
