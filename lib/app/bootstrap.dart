import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:vet_app/app/app.dart';
import 'package:vet_app/core/env/env.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  Env.assertValid();

  // Carga weekdays/months en ES para que DateFormat pueda formatear en español.
  await initializeDateFormatting('es');

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
