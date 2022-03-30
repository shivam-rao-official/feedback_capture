import 'dart:developer';
import 'dart:io';

import 'package:feedback_capture/consts/app_fonts.dart';
import 'package:feedback_capture/consts/app_sizes.dart';
import 'package:feedback_capture/consts/app_themes.dart';
import 'package:feedback_capture/controllers/category_controller.dart';
import 'package:feedback_capture/controllers/company_controller.dart';
import 'package:feedback_capture/controllers/feedback_type_controller.dart';
import 'package:feedback_capture/controllers/image_controller.dart';
import 'package:feedback_capture/controllers/outlet_controller.dart';
import 'package:feedback_capture/controllers/sub_category_controller.dart';
import 'package:feedback_capture/dbhelper/db_helper.dart';
import 'package:feedback_capture/models/category.dart';
import 'package:feedback_capture/models/company.dart';
import 'package:feedback_capture/models/feedback_type.dart';
import 'package:feedback_capture/models/outlet.dart';
import 'package:feedback_capture/views/widgets/custom_button.dart';
import 'package:feedback_capture/views/widgets/custom_clip_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? selectedOutletValue,
      selectedFeedbackValue,
      selectedCompanyValue,
      selectedCategoryValue,
      selectedSubCategoryValue,
      selectedGenreOfFeedback;

  final _outletController = OutletController();
  final _feedbackController = FeedbackTypeController();
  final _companyController = CompanyController();
  final _categoryController = CategoryController();
  final _subCategoryController = SubCategoryController();
  final _feedback = TextEditingController();
  final _cameraController = ImageController();

  // DB INSTANCE
  final dbHelper = DBHelper.instance;

  void insertData() async {
    Map<String, dynamic> row = {
      // $colIndex INTEGER PRIMARY KEY,
      // $feedbackType TEXT NOT NULL,
      // $outlet TEXT NOT NULL,
      // $company TEXT NOT NULL,
      // $category TEXT NOT NULL,
      // $subCategory TEXT NOT NULL,
      // $genreOfFeedback TEXT NOT NULL,
      // $feedback TEXT NOT NULL,
      DBHelper.outlet: selectedOutletValue,
      DBHelper.feedbackType: selectedFeedbackValue,
      DBHelper.company: selectedCompanyValue,
      DBHelper.category: selectedCategoryValue,
      DBHelper.subCategory: selectedSubCategoryValue,
      DBHelper.genreOfFeedback: selectedFeedbackValue,
      DBHelper.feedback: _feedback.text,
    };
    final id = await dbHelper.putData(row);
    log(id.toString());
  }

  List<Outlet> outletItems = [];
  List<FeedbackType> feedbackItems = [];
  List<Company> companyItems = [];
  List<Category> categoryItems = [];
  List subCategoryItems = [];
  List genreOfFeedback = [
    "Product",
    "Price",
    "Packaging",
    "Product Availability",
    "Merchandising solutions",
    "Others"
  ];

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
        _companyController.getCompanies();
        companyItems = _companyController.companyTypes;
        _categoryController.getCategories();
        categoryItems = _categoryController.categoryTypes;
        _subCategoryController.getSubCategories();
      });
    }
  }

  @override
  void dispose() {
    _outletController.dispose();
    _feedbackController.dispose();
    _companyController.dispose();
    _categoryController.dispose();
    _subCategoryController.dispose();
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
                                  height: 7.0,
                                ),
                                DropdownButtonFormField(
                                  decoration: const InputDecoration(
                                    hintText: "Select Company",
                                  ),
                                  style: const TextStyle(
                                    fontFamily: AppFonts.appFont,
                                    fontSize: AppFonts.fontSize,
                                    color: Colors.black87,
                                  ),
                                  validator: (value) => value == null
                                      ? "Select a company type"
                                      : null,
                                  value: selectedCompanyValue,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedCompanyValue = newValue!;
                                    });
                                  },
                                  items: companyItems
                                      .map<DropdownMenuItem<String>>(
                                          (Company value) {
                                    return DropdownMenuItem(
                                      child: Text(value.companyName),
                                      value: value.companyName,
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(
                                  height: 7.0,
                                ),
                                DropdownButtonFormField(
                                  decoration: const InputDecoration(
                                    hintText: "Select Category",
                                  ),
                                  style: const TextStyle(
                                    fontFamily: AppFonts.appFont,
                                    fontSize: AppFonts.fontSize,
                                    color: Colors.black87,
                                  ),
                                  validator: (value) => value == null
                                      ? "Select a category"
                                      : null,
                                  value: selectedCategoryValue,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedCategoryValue = newValue!;
                                      int index = categoryItems.indexWhere(
                                          (element) =>
                                              element.categoryName ==
                                              selectedCategoryValue);

                                      subCategoryItems = _subCategoryController
                                          .subCategoryTypes[index]
                                          .subCategoryName;

                                      selectedSubCategoryValue =
                                          subCategoryItems[0];
                                    });
                                  },
                                  items: categoryItems
                                      .map<DropdownMenuItem<String>>(
                                          (Category value) {
                                    return DropdownMenuItem(
                                      child: Text(value.categoryName),
                                      value: value.categoryName,
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(
                                  height: 7.0,
                                ),
                                DropdownButtonFormField(
                                  isExpanded: true,
                                  decoration: const InputDecoration(
                                    hintText: "Select Sub Category",
                                  ),
                                  style: const TextStyle(
                                    fontFamily: AppFonts.appFont,
                                    fontSize: AppFonts.fontSize,
                                    color: Colors.black87,
                                  ),
                                  validator: (value) => value == null
                                      ? "Select a sub category"
                                      : null,
                                  value: selectedSubCategoryValue,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedSubCategoryValue = newValue!;
                                    });
                                  },
                                  items: subCategoryItems
                                      .map<DropdownMenuItem<String>>((subCat) {
                                    return DropdownMenuItem(
                                      child: Text(subCat.toString()),
                                      value: subCat.toString(),
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(
                                  height: 7.0,
                                ),
                                DropdownButtonFormField(
                                  isExpanded: true,
                                  decoration: const InputDecoration(
                                    hintText: "Select genre of feedback",
                                  ),
                                  style: const TextStyle(
                                    fontFamily: AppFonts.appFont,
                                    fontSize: AppFonts.fontSize,
                                    color: Colors.black87,
                                  ),
                                  validator: (value) => value == null
                                      ? "Select a genre of feedback"
                                      : null,
                                  value: selectedGenreOfFeedback,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedGenreOfFeedback = newValue!;
                                    });
                                  },
                                  items: genreOfFeedback
                                      .map<DropdownMenuItem<String>>(
                                          (feedback) {
                                    return DropdownMenuItem(
                                      child: Text(feedback.toString()),
                                      value: feedback.toString(),
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(
                                  height: 7.0,
                                ),
                                TextFormField(
                                  minLines: 4,
                                  keyboardType: TextInputType.multiline,
                                  textInputAction: TextInputAction.newline,
                                  maxLines: 4,
                                  decoration: const InputDecoration(
                                    hintText: "Enter your feedback",
                                  ),
                                  maxLength: 300,
                                  controller: _feedback,
                                ),
                                const SizedBox(
                                  height: 7.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      _cameraController
                                          .getImage(ImageSource.camera);
                                    },
                                    child: imagePicker(
                                      Obx(() {
                                        return _cameraController
                                                    .selectedImagePath.value ==
                                                ''
                                            ? Icon(
                                                Icons.add_a_photo,
                                                color: Colors.grey
                                                    .withOpacity(0.4),
                                              )
                                            : Image.file(File(_cameraController
                                                .selectedImagePath.value));
                                      }),
                                    ),
                                  ),
                                ),
                                // SingleChildScrollView(
                                //   scrollDirection: Axis.horizontal,
                                //   child: Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       Padding(
                                //         padding: const EdgeInsets.all(8.0),
                                //         child: GestureDetector(
                                //           onTap: () {
                                //             _cameraController
                                //                 .getImage(ImageSource.gallery);
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
                                //                   : Image.file(File(
                                //                       _cameraController
                                //                           .selectedImagePath
                                //                           .value));
                                //             }),
                                //           ),
                                //         ),
                                //       ),
                                //       GestureDetector(
                                //         onTap: () {
                                //           _cameraController
                                //               .getImage(ImageSource.gallery);
                                //         },
                                //         child: imagePicker(
                                //           Obx(() {
                                //             return _cameraController
                                //                         .selectedImagePath
                                //                         .value ==
                                //                     ''
                                //                 ? Icon(
                                //                     Icons.add_a_photo,
                                //                     color: Colors.grey
                                //                         .withOpacity(0.4),
                                //                   )
                                //                 : Image.file(File(
                                //                     _cameraController
                                //                         .selectedImagePath
                                //                         .value));
                                //           }),
                                //         ),
                                //       ),
                                //       Padding(
                                //         padding: const EdgeInsets.all(8.0),
                                //         child: GestureDetector(
                                //           onTap: () {
                                //             _cameraController
                                //                 .getImage(ImageSource.gallery);
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
                                //                   : Image.file(File(
                                //                       _cameraController
                                //                           .selectedImagePath
                                //                           .value));
                                //             }),
                                //           ),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
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
                                      log("$selectedOutletValue");
                                      log("$selectedFeedbackValue");
                                      log("$selectedCompanyValue");
                                      log("$selectedCategoryValue");
                                      log("$selectedSubCategoryValue");
                                      log("$selectedGenreOfFeedback");
                                      log(_feedback.text);

                                      insertData();
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
