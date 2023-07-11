import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

void main() {
  runApp(NavApp());
}

class NavApp extends StatelessWidget {
  const NavApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation',
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FirstPage'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open SecondPage'),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SecondPage()));
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondPage'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('open man 3'),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Man3()));
          },
        ),
      ),
    );
  }
}

class Man3 extends StatelessWidget {
  const Man3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Man3'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('go back FirstPage'),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const FirstPage()),
                (route) => false);
          },
        ),
      ),
    );
  }
}


