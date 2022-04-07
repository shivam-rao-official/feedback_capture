import 'dart:async';
import 'dart:developer';

import 'package:feedback_capture/consts/app_fonts.dart';
import 'package:feedback_capture/consts/app_sizes.dart';
import 'package:feedback_capture/consts/app_themes.dart';
import 'package:feedback_capture/controllers/location_controller.dart';
import 'package:feedback_capture/views/pages/feedback_page.dart';
import 'package:feedback_capture/views/pages/login_page.dart';
import 'package:feedback_capture/views/widgets/custom_clip_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:location/location.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Widget _defaultHome = const LoginPage();
  final isLoggedIn = GetStorage();

  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 3000), () {
      if (isLoggedIn.read("email") != null) {
        setState(() {
          _defaultHome = const FeedbackPage();
        });
      }
      Get.offAll(() => _defaultHome);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    height: 350,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppThemes.primaryColor,
                          AppThemes.secondaryColor
                        ],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(AppSizes.bigPadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: const [
                          SizedBox(
                            height: 70.0,
                          ),
                          Text(
                            "Feedback",
                            style: TextStyle(
                              fontSize: AppFonts.headingSize,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              fontFamily: AppFonts.appFont,
                            ),
                          ),
                          Text(
                            "Capture",
                            style: TextStyle(
                              fontSize: AppFonts.fontSize,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              fontFamily: AppFonts.appFont,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
