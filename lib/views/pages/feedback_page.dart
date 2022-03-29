import 'package:feedback_capture/consts/app_fonts.dart';
import 'package:feedback_capture/consts/app_sizes.dart';
import 'package:feedback_capture/consts/app_themes.dart';
import 'package:feedback_capture/controllers/feedback_type_controller.dart';
import 'package:feedback_capture/controllers/outlet_controller.dart';
import 'package:feedback_capture/models/feedback_type.dart';
import 'package:feedback_capture/models/outlet.dart';
import 'package:feedback_capture/views/widgets/custom_button.dart';
import 'package:feedback_capture/views/widgets/custom_clip_path.dart';
import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? selectedOutletValue, selectedFeedbackValue;

  final _outletController = OutletController();
  final _feedbackController = FeedbackTypeController();

  List<Outlet> outletItems = [];
  List<FeedbackType> feedbackItems = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    if (mounted) {
      setState(() {
        _outletController.getOutlets();
        outletItems = _outletController.outlets;
        _feedbackController.getFeedbackTypes();
        feedbackItems = _feedbackController.feedbackTypes;
      });
    }
  }

  @override
  void dispose() {
    _outletController.dispose();
    _feedbackController.dispose();
    super.dispose();
  }

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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: const [
                            Text(
                              "Feedback",
                              style: TextStyle(
                                fontFamily: AppFonts.appFont,
                                fontSize: AppFonts.headingSize,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "Please provide the following information",
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
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 135.0,
                      left: AppSizes.bigPadding,
                      right: AppSizes.bigPadding,
                    ),
                    child: Container(
                      height: 550,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 236, 236, 236),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(AppSizes.pagePadding),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                DropdownButtonFormField(
                                  decoration: const InputDecoration(
                                    hintText: "Select Outlet",
                                  ),
                                  style: const TextStyle(
                                    fontFamily: AppFonts.appFont,
                                    fontSize: AppFonts.fontSize,
                                    color: Colors.black87,
                                  ),
                                  validator: (value) =>
                                      value == null ? "Select an outlet" : null,
                                  value: selectedOutletValue,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedOutletValue = newValue!;
                                    });
                                  },
                                  items: outletItems
                                      .map<DropdownMenuItem<String>>(
                                          (Outlet value) {
                                    return DropdownMenuItem(
                                      child: Text(value.outletName),
                                      value: value.outletId,
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(
                                  height: 7.0,
                                ),
                                DropdownButtonFormField(
                                  decoration: const InputDecoration(
                                    hintText: "Select feedback type",
                                  ),
                                  style: const TextStyle(
                                    fontFamily: AppFonts.appFont,
                                    fontSize: AppFonts.fontSize,
                                    color: Colors.black87,
                                  ),
                                  validator: (value) => value == null
                                      ? "Select a feedback type"
                                      : null,
                                  value: selectedFeedbackValue,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedFeedbackValue = newValue!;
                                    });
                                  },
                                  items: feedbackItems
                                      .map<DropdownMenuItem<String>>(
                                          (FeedbackType value) {
                                    return DropdownMenuItem(
                                      child: Text(value.feedbackName),
                                      value: value.feedbackName,
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                CustomButton(
                                  text: "Submit",
                                  action: () {
                                    var validate =
                                        _formKey.currentState!.validate();
                                    if (validate) {
                                      // _formKey.currentState!.save();

                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
