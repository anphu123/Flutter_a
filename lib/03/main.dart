import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Fooderlich',
            style: theme.textTheme.headline6,
          ),
        ),
        body: Center(
          // TODO: Style the title
          child: Text(
            'Let\'s get cooking 👩‍🍳',
            // TODO: Style the body text
            style: theme.textTheme.headline1,
          ),
        ),
      ),
    );
  }
}
