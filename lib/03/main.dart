import 'package:flutter/material.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Create theme

    // TODO: Apply Home widget
    return MaterialApp(
      // TODO: Add theme
    
      title: 'Fooderlich',
      home: Scaffold(
        appBar: AppBar(
            title: const Text(
          'Fooderlich',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        )),
        body: const Center(
            // TODO: Style the title
            child: Text(
          'Let\'s get cooking 👩‍🍳',
          // TODO: Style the body text
          style: TextStyle(color: Colors.black54),
        )),
      ),
    );
  }
}
