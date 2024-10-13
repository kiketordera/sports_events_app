import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:sports_events_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Full app test', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.text('YESTERDAY'), findsOneWidget);
    expect(find.text('TODAY'), findsOneWidget);
    expect(find.text('TOMORROW'), findsOneWidget);

    // Tap on TODAY tab
    await tester.tap(find.text('TODAY'));
    await tester.pumpAndSettle();

    // Verify TODAY events are displayed
    expect(find.textContaining('Today'), findsWidgets);

    // Tap on an event to navigate to details
    await tester.tap(find.text('Barty vs Osaka'));
    await tester.pumpAndSettle();

    // Verify details page is displayed
    expect(find.text('Barty vs Osaka'), findsOneWidget);
    expect(
        find.text(
            'Gummi bears cupcake sesame snaps cupcake bonbon. Halvah muffin biscuit brownie bear claw cookie croissant. Sugar plum candy canes brownie topping pudding jelly-o chocolate cake lollipop.'),
        findsOneWidget);

    // Go back to events list
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    // Verify back to TODAY events list
    await tester.tap(find.text('TOMORROW'));
    await tester.pumpAndSettle();
    expect(find.text('Tsitsipas vs Zverev'), findsOneWidget);
  });
}
