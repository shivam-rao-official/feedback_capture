import 'package:feedback_capture/views/pages/feedback_page.dart';
import 'package:feedback_capture/views/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Widget _defaultHome = const LoginPage();

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final isLoggedIn = GetStorage();

  @override
  void initState() {
    super.initState();
    if(isLoggedIn.read("email") != null){
      setState(() {
        _defaultHome = const FeedbackPage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Feedback Capture',
      debugShowCheckedModeBanner: false,
      home: _defaultHome,
    );
  }
}
