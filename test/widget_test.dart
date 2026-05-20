import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manajemen_pelayanan/main.dart';

void main() {
  testWidgets('shows login page', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Manajemen Pelayanan'), findsOneWidget);
    expect(find.text('Masuk'), findsOneWidget);
  });

  testWidgets('can add a service item', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Masuk'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Tambah Layanan'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(EditableText).at(0), 'Tes Layanan');
    await tester.enterText(find.byType(EditableText).at(1), 'Keterangan tes');
    await tester.tap(find.text('Simpan'));
    await tester.pumpAndSettle();

    expect(find.text('Tes Layanan'), findsOneWidget);
    expect(find.text('Keterangan tes'), findsOneWidget);
  });
}
