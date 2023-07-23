import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'dashboard.dart';
import 'user.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => User())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  var txtUserNameController = TextEditingController();
  var txtUserPwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Provider Login"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                TextField(
                  controller: txtUserNameController,
                  decoration: const InputDecoration(hintText: "Enter username"),
                ),
                TextField(
                  controller: txtUserPwdController,
                  decoration: const InputDecoration(hintText: "Enter password"),
                ),
                TextButton(
                  onPressed: () {
                    String userName = txtUserNameController.text.trim();
                    String password = txtUserPwdController.text.trim();

                    if (userName.isEmpty || password.isEmpty) {
                      // Hiển thị thông báo nếu người dùng bỏ trống tên đăng nhập hoặc mật khẩu
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Error"),
                            content:
                                Text("Please enter username and password."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      // Nếu tên đăng nhập và mật khẩu được nhập đầy đủ, tiến hành đăng nhập
                      Provider.of<User>(context, listen: false)
                          .signIn(userName, password);
                      Get.to(() => Dashboard());
                    }
                  },
                  child: const Text("Login"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
