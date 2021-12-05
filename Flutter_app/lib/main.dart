import 'package:flutter/material.dart';
import 'package:flutter_app/screens/track_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/functions/value_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (_) => ValueProvider(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const Trackpad(),
      },
    );
  }
}
