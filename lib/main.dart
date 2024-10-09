
import 'package:flutter/material.dart';

import 'pages/app_idade.dart';

void main() {
  runApp(const AppFaseDaVida());
}

class AppFaseDaVida extends StatelessWidget {
  const AppFaseDaVida({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IdadeApp(),
    );
  }
}