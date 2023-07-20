import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'basic.dart';
import 'demo_change_notifier.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo Provider',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('demo1 provider'),
        ),
        body: DemoChangeNotifierProvider(),
      ),
    );
  }
}
