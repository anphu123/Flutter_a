import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'RegistrationProvider.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng Ký'),
      ),
      body: Center(
        child: RegistrationForm(),
      ),
    );
  }
}

class RegistrationForm extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Tên'),
          ),
          TextFormField(
            controller: ageController,
            decoration: InputDecoration(labelText: 'Tuổi'),
          ),
          TextFormField(
            controller: phoneController,
            decoration: InputDecoration(labelText: 'Số Điện Thoại'),
          ),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(labelText: 'Mật Khẩu'),
          ),
          TextFormField(
            controller: confirmPasswordController,
            decoration: InputDecoration(labelText: 'Xác Nhận Mật Khẩu'),
          ),
          ElevatedButton(
            onPressed: () {
              RegistrationProvider provider =
                  Provider.of<RegistrationProvider>(context, listen: false);
              String name = nameController.text;
              String age = ageController.text;
              String phone = phoneController.text;
              String email = emailController.text;
              String password = passwordController.text;
              String confirmPassword = confirmPasswordController.text;

              // Kiểm tra các điều kiện và xử lý lỗi
              if (name.isEmpty) {
                provider.setError('Vui lòng nhập tên');
                return;
              }
              if (age.isEmpty) {
                provider.setError('Vui lòng nhập tuổi');
                return;
              }
              if (phone.isEmpty) {
                provider.setError('Vui lòng nhập số điện thoại');
                return;
              }
              if (email.isEmpty || !email.contains('@')) {
                provider.setError('Email không hợp lệ');
                return;
              }
              if (password.isEmpty) {
                provider.setError('Vui lòng nhập mật khẩu');
                return;
              }
              if (confirmPassword != password) {
                provider.setError('Mật khẩu không khớp');
                return;
              }

              // Nếu không có lỗi, tiến hành đăng ký
              provider.setError(null);
              // Thực hiện đăng ký người dùng
            },
            child: Text('Đăng Ký'),
          ),
          Consumer<RegistrationProvider>(
            builder: (context, provider, child) {
              if (provider.error != null) {
                return Text(
                  provider.error!,
                  style: TextStyle(color: Colors.red),
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
