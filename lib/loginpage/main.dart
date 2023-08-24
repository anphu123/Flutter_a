import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/loginpage/Ui/CustomInputfield.dart';

void main() {
  runApp(MaterialApp(
    title: 'Login App',
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.blue,

        child: Center(
          child: Container(
            width: 400,
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomInputField(
                    Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    "user name"),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: CustomInputField(
                      Icon(Icons.lock, color: Colors.white), "pass"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: SizedBox(
                    width: 100,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange, elevation: 20,shadowColor: Colors.deepOrange),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
