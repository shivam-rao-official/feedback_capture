import 'package:feedback_capture/views/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget _defaultHome = const LoginPage();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Feedback Capture',
      debugShowCheckedModeBanner: false,
      home: _defaultHome,
    );
  }
}
