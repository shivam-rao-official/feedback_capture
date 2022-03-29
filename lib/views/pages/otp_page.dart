import 'package:feedback_capture/consts/app_fonts.dart';
import 'package:feedback_capture/consts/app_sizes.dart';
import 'package:feedback_capture/consts/app_themes.dart';
import 'package:feedback_capture/views/dialogs/toast_msg.dart';
import 'package:feedback_capture/views/pages/feedback_page.dart';
import 'package:feedback_capture/views/widgets/custom_button.dart';
import 'package:feedback_capture/views/widgets/custom_clip_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpPage extends StatefulWidget {
  final String email;
  const OtpPage({Key? key, required this.email}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _otp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: CustomClipPath(),
                    child: Container(
                      height: 350,
                      // width: double.infinity,
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
                              "Account",
                              style: TextStyle(
                                fontFamily: AppFonts.appFont,
                                fontSize: AppFonts.headingSize,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Verify",
                              style: TextStyle(
                                fontFamily: AppFonts.appFont,
                                fontSize: AppFonts.subHeadingSize,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            Text(
                              "Please enter your verification code",
                              style: TextStyle(
                                fontFamily: AppFonts.appFont,
                                fontSize: AppFonts.fontSize,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 17.0,
                    left: 15.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: AppThemes.primaryColor,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        primary: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(AppSizes.bigPadding),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "We sent a verification code to ${widget.email}",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 82, 82, 82),
                          fontSize: 13.0,
                          fontFamily: AppFonts.appFont,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (input) =>
                            input!.isEmpty ? "Enter valid OTP" : null,
                        style: const TextStyle(
                          fontSize: AppFonts.fontSize,
                          // fontFamily: AppFonts.appFont,
                        ),
                        onSaved: (value) => _otp = value!,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: const InputDecoration(
                          hintText: "OTP",
                          prefixIcon: Icon(Icons.numbers, size: 20.0),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                        text: "Verify OTP",
                        action: () {
                          var validate = _formKey.currentState!.validate();
                          if (validate) {
                            _formKey.currentState!.save();
                            if (_otp == '123456') {
                              ToastMsg().successToast(
                                  "OTP matched. Login successfull.");
                              Get.offAll(
                                () => const FeedbackPage(),
                              );
                            } else {
                              ToastMsg().errorToast(
                                  "OTP not matched. Please enter correct OTP.");
                            }
                          }
                        },
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      const Text(
                        "Didn't receive code? Resend again",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13.0,
                          fontFamily: AppFonts.appFont,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
