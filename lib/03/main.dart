import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';
import 'home.dart';


void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Create theme
    final theme = FooderlichTheme.dark();

    // TODO: Apply Home widget
    return MaterialApp(
      // TODO: Add theme
      theme: theme,
      title: 'Fooderlich',
      home: Home(),
    );
  }
}
