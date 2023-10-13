import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'RegisterScreen.dart';
import 'RegistrationProvider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => RegistrationProvider(),
      child: MaterialApp(
        home: RegisterScreen(),
      ),
    ),
  );
}
