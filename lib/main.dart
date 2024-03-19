import 'package:eterna_native/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 8, 143, 143),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontWeight: FontWeight.bold),
  ),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    runApp(const ProviderScope(child: MyApp()));
  });
  // runApp(const ProviderScope(child: MyApp()),);
}

class MyApp extends StatelessWidget {
  const MyApp({ super.key });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const Entry(),
    );
  }
}
