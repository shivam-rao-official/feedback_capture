import 'package:feedback_capture/consts/app_fonts.dart';
import 'package:feedback_capture/consts/app_sizes.dart';
import 'package:feedback_capture/consts/app_themes.dart';
import 'package:feedback_capture/dbhelper/db_helper.dart';
import 'package:feedback_capture/dbhelper/imagedb_helper.dart';
import 'package:feedback_capture/views/pages/feedback_list.dart';
import 'package:feedback_capture/views/widgets/custom_button.dart';
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
  final storeUserMail = GetStorage();

  // DB INSTANCE -- Db Insertion
  final dbHelper = DBHelper.instance;
  final imagedbHelper = ImageDBHelper.instance;

  @override
  void initState() {
    super.initState();
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
                          children: const [
                            Text(
                              "Feedback",
                              style: TextStyle(
                                fontFamily: AppFonts.appFont,
                                fontSize: AppFonts.subHeadingSize,
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
                                // SingleChildScrollView(
                                //   scrollDirection: Axis.horizontal,
                                //   child: Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       SizedBox(
                                //         width: 100,
                                //         child: GestureDetector(
                                //           onTap: () {
                                //             _cameraController
                                //                     .isImageSelected.isFalse
                                //                 ? showModalBottomSheet(
                                //                     context: context,
                                //                     builder: ((builder) =>
                                //                         CustomOpenImage(
                                //                           context: context,
                                //                           controller:
                                //                               _cameraController,
                                //                         )))
                                //                 : null;
                                //           },
                                //           child: imagePicker(
                                //             Obx(() {
                                //               return _cameraController
                                //                           .selectedImagePath
                                //                           .value ==
                                //                       ''
                                //                   ? Icon(
                                //                       Icons.add_a_photo,
                                //                       color: Colors.grey
                                //                           .withOpacity(0.4),
                                //                     )
                                //                   : Stack(
                                //                       children: [
                                //                         SizedBox(
                                //                           height: 150,
                                //                           width: 100,
                                //                           child: Image.file(
                                //                             File(_cameraController
                                //                                 .selectedImagePath
                                //                                 .value),
                                //                             fit: BoxFit.fill,
                                //                           ),
                                //                         ),
                                //                         Positioned(
                                //                           bottom: 0,
                                //                           child: Container(
                                //                             width: MediaQuery.of(
                                //                                             context)
                                //                                         .size
                                //                                         .width /
                                //                                     4 +
                                //                                 4,
                                //                             height: 20,
                                //                             decoration:
                                //                                 BoxDecoration(
                                //                               color: Colors.red,
                                //                               borderRadius:
                                //                                   BorderRadius
                                //                                       .circular(
                                //                                           3),
                                //                             ),
                                //                             child: Center(
                                //                               child:
                                //                                   MaterialButton(
                                //                                       onPressed:
                                //                                           () {
                                //                                         _cameraController
                                //                                             .selectedImagePath
                                //                                             .value = '';
                                //                                         _cameraController
                                //                                             .isImageSelected
                                //                                             .value = false;
                                //                                       },
                                //                                       child: const Text(
                                //                                           "DELETE")),
                                //                             ),
                                //                           ),
                                //                         ),
                                //                       ],
                                //                     );
                                //             }),
                                //           ),
                                //         ),
                                //       ),
                                //       const SizedBox(
                                //         width: 3.0,
                                //       ),
                                //       SizedBox(
                                //         width: 100,
                                //         child: GestureDetector(
                                //           onTap: () {
                                //             _cameraController1
                                //                     .isImageSelected.isFalse
                                //                 ? showModalBottomSheet(
                                //                     context: context,
                                //                     builder: ((builder) =>
                                //                         CustomOpenImage(
                                //                           context: context,
                                //                           controller:
                                //                               _cameraController1,
                                //                         )))
                                //                 : null;
                                //           },
                                //           child: imagePicker(
                                //             Obx(() {
                                //               return _cameraController1
                                //                           .selectedImagePath
                                //                           .value ==
                                //                       ''
                                //                   ? Icon(
                                //                       Icons.add_a_photo,
                                //                       color: Colors.grey
                                //                           .withOpacity(0.4),
                                //                     )
                                //                   : Stack(
                                //                       children: [
                                //                         SizedBox(
                                //                           height: 150,
                                //                           width: 100,
                                //                           child: Image.file(
                                //                             File(_cameraController1
                                //                                 .selectedImagePath
                                //                                 .value),
                                //                             fit: BoxFit.fill,
                                //                           ),
                                //                         ),
                                //                         Positioned(
                                //                           bottom: 0,
                                //                           child: Container(
                                //                             width: MediaQuery.of(
                                //                                             context)
                                //                                         .size
                                //                                         .width /
                                //                                     4 +
                                //                                 4,
                                //                             height: 20,
                                //                             decoration:
                                //                                 BoxDecoration(
                                //                               color: Colors.red,
                                //                               borderRadius:
                                //                                   BorderRadius
                                //                                       .circular(
                                //                                           3),
                                //                             ),
                                //                             child: Center(
                                //                               child:
                                //                                   MaterialButton(
                                //                                       onPressed:
                                //                                           () {
                                //                                         _cameraController1
                                //                                             .selectedImagePath
                                //                                             .value = '';
                                //                                         _cameraController1
                                //                                             .isImageSelected
                                //                                             .value = false;
                                //                                       },
                                //                                       child: const Text(
                                //                                           "DELETE")),
                                //                             ),
                                //                           ),
                                //                         ),
                                //                       ],
                                //                     );
                                //             }),
                                //           ),
                                //         ),
                                //       ),
                                //       const SizedBox(
                                //         width: 3.0,
                                //       ),
                                //       SizedBox(
                                //         width: 100,
                                //         child: GestureDetector(
                                //           onTap: () {
                                //             _cameraController2
                                //                     .isImageSelected.isFalse
                                //                 ? showModalBottomSheet(
                                //                     context: context,
                                //                     builder: ((builder) =>
                                //                         CustomOpenImage(
                                //                           context: context,
                                //                           controller:
                                //                               _cameraController2,
                                //                         )))
                                //                 : null;
                                //           },
                                //           child: imagePicker(
                                //             Obx(() {
                                //               return _cameraController2
                                //                           .selectedImagePath
                                //                           .value ==
                                //                       ''
                                //                   ? Icon(
                                //                       Icons.add_a_photo,
                                //                       color: Colors.grey
                                //                           .withOpacity(0.4),
                                //                     )
                                //                   : Stack(
                                //                       children: [
                                //                         SizedBox(
                                //                           height: 150,
                                //                           width: 100,
                                //                           child: Image.file(
                                //                             File(_cameraController2
                                //                                 .selectedImagePath
                                //                                 .value),
                                //                             fit: BoxFit.fill,
                                //                           ),
                                //                         ),
                                //                       ],
                                //                     );
                                //             }),
                                //           ),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
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

  Widget imagePicker(Obx obx) {
    return Container(
      child: Center(child: obx),
      height: 150,
      width: MediaQuery.of(context).size.width,
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
