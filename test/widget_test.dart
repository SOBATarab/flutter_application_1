import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('shows manual brew recipes and ratio calculator', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ManualBrewApp());

    expect(find.text('Artisan Brew'), findsOneWidget);
    expect(find.text('Selamat Pagi,\nCoffee Lover'), findsOneWidget);
    expect(find.text('V60 Balanced Daily Cup'), findsWidgets);
    expect(find.text('Kalita Sweet Cup'), findsOneWidget);

    await tester.tap(find.text('Brew'));
    await tester.pumpAndSettle();

    expect(find.text('Kalkulator rasio'), findsOneWidget);
    expect(find.text('Profil biji kopi'), findsOneWidget);
    expect(find.text('Typica / Bourbon'), findsWidgets);
    expect(find.text('18 g kopi -> 270 g air'), findsOneWidget);
  });

  testWidgets('can select another recipe', (WidgetTester tester) async {
    await tester.pumpWidget(const ManualBrewApp());

    await tester.tap(find.text('AeroPress Quick Morning').first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Brew'));
    await tester.pumpAndSettle();

    expect(find.text('16 g kopi -> 224 g air'), findsOneWidget);
    expect(find.byIcon(Icons.restart_alt), findsOneWidget);
  });

  testWidgets('can add a custom manual brew recipe', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ManualBrewApp());

    await tester.tap(find.byTooltip('Tambah resep'));
    await tester.pumpAndSettle();

    expect(find.text('Pilih foto'), findsOneWidget);

    await tester.enterText(
      find.widgetWithText(TextFormField, 'Nama resep'),
      'Origami Honey Cup',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Metode'),
      'Origami',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Deskripsi'),
      'Resep manis untuk beans honey process.',
    );
    await tester.enterText(find.widgetWithText(TextFormField, 'Kopi (g)'), '20');
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Rasio 1:x'),
      '16',
    );
    await tester.enterText(find.widgetWithText(TextFormField, 'Suhu (C)'), '91');
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Grind size'),
      'Medium',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Profil rasa'),
      'Honey, apple, soft finish',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Karakter biji'),
      'Sweet honey, apple, clean finish',
    );

    await tester.ensureVisible(find.text('Simpan'));
    await tester.tap(find.text('Simpan'));
    await tester.pumpAndSettle();

    expect(find.text('4 resep'), findsOneWidget);
    expect(find.text('Origami Honey Cup'), findsWidgets);

    await tester.tap(find.text('Brew'));
    await tester.pumpAndSettle();

    expect(find.text('20 g kopi -> 320 g air'), findsOneWidget);
    expect(find.text('Sweet honey, apple, clean finish'), findsOneWidget);
    expect(find.text('Custom'), findsOneWidget);
  });

  testWidgets('can delete a recipe after confirmation', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ManualBrewApp());

    await tester.tap(find.byTooltip('Tambah resep'));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.widgetWithText(TextFormField, 'Nama resep'),
      'Origami Honey Cup',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Metode'),
      'Origami',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Deskripsi'),
      'Resep manis untuk beans honey process.',
    );
    await tester.enterText(find.widgetWithText(TextFormField, 'Kopi (g)'), '20');
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Rasio 1:x'),
      '16',
    );
    await tester.enterText(find.widgetWithText(TextFormField, 'Suhu (C)'), '91');
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Grind size'),
      'Medium',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Profil rasa'),
      'Honey, apple, soft finish',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Karakter biji'),
      'Sweet honey, apple, clean finish',
    );
    await tester.ensureVisible(find.text('Simpan'));
    await tester.tap(find.text('Simpan'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Koleksi'));
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Hapus Origami Honey Cup'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, 'Hapus'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Beranda'));
    await tester.pumpAndSettle();

    expect(find.text('3 resep'), findsOneWidget);
    expect(find.text('Origami Honey Cup'), findsNothing);
    expect(find.text('V60 Balanced Daily Cup'), findsWidgets);
  });
}
