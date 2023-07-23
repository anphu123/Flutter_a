import 'package:flutter/material.dart';
import 'user.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(builder: (context,user,_){
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text("Dashboard"),),
          body: Center(child: Text(user.email,style: const TextStyle(color: Colors.blueAccent,fontSize: 30.0),)),
        ),
      );
    }
    );
  }
}