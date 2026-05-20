import 'package:flutter_test/flutter_test.dart';
import 'package:manajemen_pelayanan/main.dart';

void main() {
  testWidgets('shows login page', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Manajemen Pelayanan'), findsOneWidget);
    expect(find.text('Masuk'), findsOneWidget);
  });
}
