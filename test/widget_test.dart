import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vet_app/app/app.dart';

void main() {
  testWidgets('App shows loading indicator on boot', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: App()));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
