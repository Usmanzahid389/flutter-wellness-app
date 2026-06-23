import 'package:flutter_test/flutter_test.dart';
import 'package:test_task/app.dart';

void main() {
  testWidgets('App launches on Nutrition tab', (WidgetTester tester) async {
    await tester.pumpWidget(const TestTaskApp());
    await tester.pumpAndSettle();

    expect(find.text('Workouts'), findsOneWidget);
    expect(find.text('My Insights'), findsOneWidget);
    expect(find.text('Nutrition'), findsOneWidget);
  });
}
