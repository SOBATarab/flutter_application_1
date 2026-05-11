import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('shows manual brew recipes and ratio calculator', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ManualBrewApp());

    expect(find.text('Manual Brew'), findsOneWidget);
    expect(find.text('V60 Balanced Daily Cup'), findsWidgets);
    expect(find.text('Kalita Sweet Cup'), findsOneWidget);
    expect(find.text('Kalkulator rasio'), findsOneWidget);
    expect(find.text('18 g kopi -> 270 g air'), findsOneWidget);
  });

  testWidgets('can select another recipe', (WidgetTester tester) async {
    await tester.pumpWidget(const ManualBrewApp());

    await tester.tap(find.text('AeroPress Quick Morning').first);
    await tester.pumpAndSettle();

    expect(find.text('16 g kopi -> 224 g air'), findsOneWidget);
    expect(find.byIcon(Icons.restart_alt), findsOneWidget);
  });
}
