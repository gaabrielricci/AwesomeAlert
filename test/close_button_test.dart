import 'package:awesome_alert/awesome_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('double tap on the close button pops only the alert', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          body: TextButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(
              builder: (context) => Scaffold(
                body: TextButton(
                  onPressed: () => AwesomeAlert.show(
                    context,
                    title: 'T',
                    description: 'D',
                    confirmText: 'OK',
                    confirmAction: () {},
                    showCloseButton: true,
                  ),
                  child: const Text('open alert'),
                ),
              ),
            )),
            child: const Text('open page'),
          ),
        ),
      ),
    ));

    await tester.tap(find.text('open page'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('open alert'));
    await tester.pumpAndSettle();

    // Two callbacks in the same frame, before the route leaves the stack (what a tap
    // does not reproduce: the leaving route already absorbs pointers).
    final onPressed = tester.widget<IconButton>(find.widgetWithIcon(IconButton, Icons.close)).onPressed!;
    onPressed();
    onPressed();
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.text('open alert'), findsOneWidget, reason: 'the page under the alert must stay');
  });
}
