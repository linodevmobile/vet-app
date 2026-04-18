import 'package:flutter_test/flutter_test.dart';
import 'package:vet_app/app/app.dart';

void main() {
  testWidgets('App renders title', (tester) async {
    await tester.pumpWidget(const App());
    expect(find.text('VetApp'), findsOneWidget);
  });
}
