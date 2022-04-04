import 'dart:io';

import 'package:feedback_capture/consts/app_fonts.dart';
import 'package:feedback_capture/consts/app_sizes.dart';
import 'package:feedback_capture/consts/app_themes.dart';
import 'package:feedback_capture/dbhelper/db_helper.dart';
import 'package:feedback_capture/dbhelper/imagedb_helper.dart';
import 'package:feedback_capture/views/widgets/custom_clip_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FeedbackShow extends StatefulWidget {
  final int colId;
  final String? selectedOutletValue,
      selectedFeedbackValue,
      selectedCompanyValue,
      selectedCategoryValue,
      selectedSubCategoryValue,
      selectedGenreOfFeedback,
      selectedFeedback;
  const FeedbackShow({
    Key? key,
    required this.colId,
    required this.selectedOutletValue,
    required this.selectedFeedbackValue,
    required this.selectedCompanyValue,
    required this.selectedCategoryValue,
    required this.selectedSubCategoryValue,
    required this.selectedGenreOfFeedback,
    required this.selectedFeedback,
  }) : super(key: key);

  @override
  State<FeedbackShow> createState() => _FeedbackShowState();
}

class _FeedbackShowState extends State<FeedbackShow> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? userMail;

  // DB INSTANCE -- Db Insertion
  final dbHelper = DBHelper.instance;
  final imagedbHelper = ImageDBHelper.instance;

  // var r = await imagedbHelper.getImage(email);
  Future<List> getImage(String email, int id) async {
    var r = await imagedbHelper.getImage(email, id);
    // log(r.toString());
    return r;
  }

  @override
  void initState() {
    super.initState();
    userMail = GetStorage().read("email");
    getImage(userMail!, widget.colId);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
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
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Feedback",
                                  style: TextStyle(
                                    fontFamily: AppFonts.appFont,
                                    fontSize: AppFonts.subHeadingSize,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Center(
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: AppThemes.primaryColor,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    primary: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
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
                      left: AppSizes.bigPadding - 10,
                      right: AppSizes.bigPadding - 10,
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height - 185,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 236, 236, 236),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Form(
                        key: _formKey,
                        child: Padding(
                          padding:
                              const EdgeInsets.all(AppSizes.pagePadding - 10),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                TextFormField(
                                  enabled: false,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    labelText:
                                        "Outlet Name: ${widget.selectedOutletValue}",
                                  ),
                                ),
                                const SizedBox(
                                  height: 7.0,
                                ),
                                TextFormField(
                                  enabled: false,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    labelText:
                                        "Feedback Type: ${widget.selectedFeedbackValue}",
                                  ),
                                ),
                                const SizedBox(
                                  height: 7.0,
                                ),
                                TextFormField(
                                  enabled: false,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    labelText:
                                        "Company Name: ${widget.selectedCompanyValue}",
                                  ),
                                ),
                                const SizedBox(
                                  height: 7.0,
                                ),
                                TextFormField(
                                  enabled: false,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    labelText:
                                        "Category: ${widget.selectedCategoryValue}",
                                  ),
                                ),
                                const SizedBox(
                                  height: 7.0,
                                ),
                                TextFormField(
                                  enabled: false,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    labelText:
                                        "SubCategory: ${widget.selectedSubCategoryValue}",
                                  ),
                                ),
                                const SizedBox(
                                  height: 7.0,
                                ),
                                TextFormField(
                                  enabled: false,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    labelText:
                                        "Genre of Feedback: ${widget.selectedGenreOfFeedback}",
                                  ),
                                ),
                                const SizedBox(
                                  height: 13.0,
                                ),
                                TextFormField(
                                  enabled: false,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    labelText:
                                        "Feedback: ${widget.selectedFeedback}",
                                  ),
                                ),
                                const SizedBox(
                                  height: 7.0,
                                ),
                                SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: FutureBuilder(
                                        future:
                                            getImage(userMail!, widget.colId),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData == false) {
                                            return const Center(
                                                child: Text("No Data Found"));
                                          }
                                          if (snapshot.hasError) {
                                            return const Center(
                                                child: Text("Error Occurred"));
                                          }
                                          return Row(
                                            children: [
                                              showImage((snapshot.data!
                                                              as List)[0]
                                                          ['Image1'] !=
                                                      ''
                                                  ? SizedBox(
                                                      height: 150,
                                                      width: 100,
                                                      child: Image.file(
                                                          File((snapshot.data!
                                                                  as List)[0]
                                                              ['Image1']),
                                                          fit: BoxFit.cover),
                                                    )
                                                  : const Center(
                                                      child: Text("No Preview"),
                                                    )),
                                              showImage((snapshot.data!
                                                              as List)[0]
                                                          ['Image2'] !=
                                                      ''
                                                  ? SizedBox(
                                                      height: 150,
                                                      width: 100,
                                                      child: Image.file(
                                                          File((snapshot.data!
                                                                  as List)[0]
                                                              ['Image2']),
                                                          fit: BoxFit.cover),
                                                    )
                                                  : const Center(
                                                      child: Text("No Preview"),
                                                    )),
                                              showImage((snapshot.data!
                                                              as List)[0]
                                                          ['Image3'] !=
                                                      ''
                                                  ? SizedBox(
                                                      height: 150,
                                                      width: 100,
                                                      child: Image.file(
                                                          File((snapshot.data!
                                                                  as List)[0]
                                                              ['Image3']),
                                                          fit: BoxFit.cover),
                                                    )
                                                  : const Center(
                                                      child: Text("No Preview"),
                                                    )),
                                            ],
                                          );
                                        })),
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

  Widget showImage(Widget wd) {
    return Container(
      child: wd,
      height: 150,
      width: 100,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 3.0,
            color: Colors.amber.withOpacity(0.4),
          ),
          right: BorderSide(
            width: 3.0,
            color: Colors.amber.withOpacity(0.4),
          ),
          bottom: BorderSide(
            width: 3.0,
            color: Colors.amber.withOpacity(0.4),
          ),
          left: BorderSide(
            width: 3.0,
            color: Colors.amber.withOpacity(0.4),
          ),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
