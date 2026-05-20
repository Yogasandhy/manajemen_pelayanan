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

    await tester.enterText(
      find.byKey(const Key('service_name_field')),
      'Tes Layanan',
    );
    await tester.enterText(
      find.byKey(const Key('service_description_field')),
      'Keterangan tes',
    );
    expect(find.text('Tes Layanan'), findsOneWidget);
    expect(find.text('Keterangan tes'), findsOneWidget);

    tester.testTextInput.hide();
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.byKey(const Key('save_service_button')));
    await tester.tap(find.byKey(const Key('save_service_button')));
    await tester.pumpAndSettle();

    expect(find.text('Tes Layanan'), findsOneWidget);
    expect(find.text('Keterangan tes'), findsOneWidget);
  });
}
