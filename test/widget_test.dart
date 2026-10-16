import 'package:do_an_flutter/Home/inbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App loads smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: InboxPage(),
    ));

    expect(find.byType(Scaffold), findsOneWidget);
  });
}
