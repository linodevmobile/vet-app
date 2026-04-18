import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vet_app/app/app.dart';
import 'package:vet_app/core/env/env.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  Env.assertValid();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
