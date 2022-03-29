import 'package:feedback_capture/consts/app_fonts.dart';
import 'package:feedback_capture/consts/app_sizes.dart';
import 'package:feedback_capture/consts/app_themes.dart';
import 'package:feedback_capture/views/dialogs/toast_msg.dart';
import 'package:feedback_capture/views/pages/otp_page.dart';
import 'package:feedback_capture/views/widgets/custom_button.dart';
import 'package:feedback_capture/views/widgets/custom_clip_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                          "Welcome",
                          style: TextStyle(
                            fontSize: AppFonts.headingSize,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            fontFamily: AppFonts.appFont,
                          ),
                        ),
                        Text(
                          "Back",
                          style: TextStyle(
                            fontSize: AppFonts.subHeadingSize,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            fontFamily: AppFonts.appFont,
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Text(
                          "Please signin to continue",
                          style: TextStyle(
                            fontSize: AppFonts.fontSize,
                            color: Colors.white,
                            fontFamily: AppFonts.appFont,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppSizes.bigPadding),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (input) => !input!.contains("@")
                            ? "Enter valid email id"
                            : null,
                        style: const TextStyle(
                          fontSize: AppFonts.fontSize,
                          fontFamily: AppFonts.appFont,
                        ),
                        onSaved: (value) => _email = value!,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: const InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(Icons.email_outlined, size: 20.0),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      const Text(
                        "You will receive an OTP on this email.",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13.0,
                          fontFamily: AppFonts.appFont,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                        text: "Login",
                        action: () {
                          var validate = _formKey.currentState!.validate();
                          if (validate) {
                            _formKey.currentState!.save();
                            ToastMsg().successToast(
                                "We have sent the OTP on $_email");
                            // api call function to send email on this id
                            Get.to(
                              () => OtpPage(
                                email: _email,
                              ),
                            );
                          }
                        },
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
