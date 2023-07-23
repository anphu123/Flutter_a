import 'package:flutter/material.dart';

class User extends ChangeNotifier{

  String email = "";
  String pwd = "";

  void signIn(String emailTxt, String pwdTxt){
    email = emailTxt;
    pwd = pwdTxt;
    notifyListeners();
  }
}