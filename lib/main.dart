import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comic demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}): super(key: key);

  List<Station> stations = [
    Station(1, 'a11', 'c', true),
    Station(2, 'a12', 'b', true),
    Station(3, 'a13', 'c', true),
    Station(4, 'a14', 'b', true),
    Station(5, 'a15', 'c', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('home')),
      body: ListView.builder(
          itemCount: stations.length,
          itemBuilder: (context, index) {
            final item = stations[index];
            return ListTile(
              leading: Icon(Icons.online_prediction),
              title: Text(item.name),
              trailing: Icon(Icons.public),
            );
          }),
    );
  }
}

class Station {
  int id;
  String name;
  String type;
  bool status;

  Station(this.id, this.name, this.type, this.status);
}
