import 'dart:io';

import 'package:feedback_capture/consts/app_fonts.dart';
import 'package:feedback_capture/consts/app_sizes.dart';
import 'package:feedback_capture/consts/app_themes.dart';
import 'package:feedback_capture/controllers/company_controller.dart';
import 'package:feedback_capture/controllers/feedback_type_controller.dart';
import 'package:feedback_capture/controllers/image_controller.dart';
import 'package:feedback_capture/controllers/outlet_controller.dart';
import 'package:feedback_capture/controllers/product_controller.dart';
import 'package:feedback_capture/dbhelper/db_helper.dart';
import 'package:feedback_capture/dbhelper/imagedb_helper.dart';
import 'package:feedback_capture/models/company.dart';
import 'package:feedback_capture/models/feedback_type.dart';
import 'package:feedback_capture/models/outlet.dart';
import 'package:feedback_capture/models/product.dart';
import 'package:feedback_capture/views/dialogs/toast_msg.dart';
import 'package:feedback_capture/views/pages/feedback_list.dart';
import 'package:feedback_capture/views/pages/login_page.dart';
import 'package:feedback_capture/views/widgets/custom_button.dart';
import 'package:feedback_capture/views/widgets/custom_clip_path.dart';
import 'package:feedback_capture/views/widgets/custom_open_image.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final storeUserMail = GetStorage();
  String? selectedOutletValue,
      selectedFeedbackValue,
      selectedCompanyValue,
      selectedCategoryValue,
      selectedSubCategoryValue,
      selectedGenreOfFeedback,
      selectedProductValue;

  // Init Controllers
  final _outletController = OutletController();
  final _feedbackController = FeedbackTypeController();
  final _companyController = CompanyController();
  final _productController = ProductController();
  // final _subCategoryController = SubCategoryController();
  final _feedback = TextEditingController();
  final _cameraController = ImageController();
  final _cameraController1 = ImageController();
  final _cameraController2 = ImageController();

  final TextEditingController _categoryValue = TextEditingController();
  final TextEditingController _subCategoryValue = TextEditingController();

  // DB INSTANCE -- Db Insertion
  final dbHelper = DBHelper.instance;
  final imagedbHelper = ImageDBHelper.instance;

  void insertData() async {
    try {
      Map<String, dynamic> row = {
        DBHelper.email: storeUserMail.read("email"),
        DBHelper.outlet: selectedOutletValue,
        DBHelper.feedbackType: selectedFeedbackValue,
        DBHelper.company: selectedCompanyValue,
        DBHelper.product: selectedProductValue,
        DBHelper.category: _categoryValue.text,
        DBHelper.subCategory: _subCategoryValue.text,
        DBHelper.genreOfFeedback: selectedFeedbackValue,
        DBHelper.feedback: _feedback.text,
      };

      Map<String, dynamic> imagedata = {
        ImageDBHelper.email: storeUserMail.read("email"),
        ImageDBHelper.image1: _cameraController.selectedImagePath.value,
        ImageDBHelper.image2: _cameraController1.selectedImagePath.value,
        ImageDBHelper.image3: _cameraController2.selectedImagePath.value,
      };
      await dbHelper.putData(row);
      await imagedbHelper.putImage(imagedata);
      ToastMsg().successToast("Thank You for the feedback");
      setState(() {
        selectedOutletValue = null;
        selectedFeedbackValue = null;
        selectedCompanyValue = null;
        selectedProductValue = null;
        _categoryValue.text = '';
        _subCategoryValue.text = '';
        selectedGenreOfFeedback = null;
        _feedback.clear();
        _cameraController.selectedImagePath.value = '';
        _cameraController1.selectedImagePath.value = '';
        _cameraController2.selectedImagePath.value = '';
        _cameraController.toBase64String.value = '';
        _cameraController1.toBase64String.value = '';
        _cameraController2.toBase64String.value = '';
      });
    } catch (e) {
      ToastMsg().errorToast(e.toString());
    }
  }
  // DB Function End.

  List<Outlet> outletItems = [];
  List<FeedbackType> feedbackItems = [];
  List<Company> companyItems = [];
  List<Product> productItems = [];
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
        _productController.getProducts();
        productItems = _productController.productTypes;
      });
    }
  }

  @override
  void dispose() {
    _outletController.dispose();
    _feedbackController.dispose();
    _companyController.dispose();
    _productController.dispose();
    // _subCategoryController.dispose();
    _feedback.dispose();
    _cameraController.dispose();
    _cameraController1.dispose();
    _cameraController2.dispose();

    _categoryValue.dispose();
    _subCategoryValue.dispose();
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
                                    storeUserMail.remove("email");
                                    Get.off(() => const LoginPage());
                                  },
                                  child: const Icon(
                                    Icons.logout_outlined,
                                    color: AppThemes.primaryColor,
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
                                DropdownSearch<Product>(
                                  mode: Mode.BOTTOM_SHEET,
                                  showSearchBox: true,
                                  showClearButton: true,
                                  dropdownSearchDecoration:
                                      const InputDecoration(
                                    hintText: "Select Product",
                                  ),
                                  validator: (input) => (input == null)
                                      ? "Select a product to continue"
                                      : null,
                                  items: productItems,
                                  itemAsString: (productItems) =>
                                      productItems!.productName.toString(),
                                  onChanged: (data) {
                                    selectedProductValue =
                                        data?.productName ?? '';
                                    if (selectedProductValue != '') {
                                      int index = productItems.indexWhere(
                                          (element) =>
                                              element.productName ==
                                              data!.productName);

                                      _categoryValue.text = _productController
                                          .productTypes[index].categoryName;
                                      _subCategoryValue.text =
                                          _productController.productTypes[index]
                                              .subCategoryName;
                                    } else {
                                      _categoryValue.text = '';
                                      _subCategoryValue.text = '';
                                    }
                                  },
                                ),
                                TextFormField(
                                  enabled: false,
                                  validator: (input) => (input!.length < 2)
                                      ? "Category must not be empty"
                                      : null,
                                  style: const TextStyle(
                                    fontSize: AppFonts.fontSize,
                                  ),
                                  controller: _categoryValue,
                                  decoration: const InputDecoration(
                                    hintText: "Category",
                                  ),
                                ),
                                const SizedBox(
                                  height: 7.0,
                                ),
                                TextFormField(
                                  enabled: false,
                                  validator: (input) => (input!.length < 2)
                                      ? "Sub Category must not be empty"
                                      : null,
                                  style: const TextStyle(
                                    fontSize: AppFonts.fontSize,
                                  ),
                                  controller: _subCategoryValue,
                                  decoration: const InputDecoration(
                                    hintText: "Sub Category",
                                  ),
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
                                  height: 13.0,
                                ),
                                TextFormField(
                                  minLines: 4,
                                  keyboardType: TextInputType.multiline,
                                  textInputAction: TextInputAction.newline,
                                  maxLines: 4,
                                  decoration: const InputDecoration(
                                    hintText: "Enter your feedback",
                                    border: OutlineInputBorder(),
                                  ),
                                  maxLength: 300,
                                  controller: _feedback,
                                  style: const TextStyle(
                                    fontFamily: AppFonts.appFont,
                                    fontSize: AppFonts.fontSize,
                                  ),
                                  validator: (value) => value == null
                                      ? "Feedback is inportant"
                                      : null,
                                ),
                                const SizedBox(
                                  height: 7.0,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child: GestureDetector(
                                          onTap: () {
                                            _cameraController
                                                    .isImageSelected.isFalse
                                                ? showModalBottomSheet(
                                                    context: context,
                                                    builder: ((builder) =>
                                                        CustomOpenImage(
                                                          context: context,
                                                          controller:
                                                              _cameraController,
                                                        )))
                                                : null;
                                          },
                                          child: imagePicker(
                                            Obx(() {
                                              return _cameraController
                                                          .selectedImagePath
                                                          .value ==
                                                      ''
                                                  ? Icon(
                                                      Icons.add_a_photo,
                                                      color: Colors.grey
                                                          .withOpacity(0.4),
                                                    )
                                                  : Stack(
                                                      children: [
                                                        SizedBox(
                                                          height: 150,
                                                          width: 100,
                                                          child: Image.file(
                                                            File(_cameraController
                                                                .selectedImagePath
                                                                .value),
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 0,
                                                          child: Container(
                                                            width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    4 +
                                                                4,
                                                            height: 20,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors.red,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          3),
                                                            ),
                                                            child: Center(
                                                              child: MaterialButton(
                                                                  onPressed: () {
                                                                    Get.defaultDialog(
                                                                        title: "Action Required",
                                                                        middleText: "Are you sure to delete this Image?",
                                                                        onCancel: () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        confirmTextColor: Colors.white,
                                                                        onConfirm: () {
                                                                          _cameraController
                                                                              .selectedImagePath
                                                                              .value = '';
                                                                          _cameraController
                                                                              .isImageSelected
                                                                              .value = false;
                                                                          Navigator.pop(
                                                                              context);
                                                                        });
                                                                  },
                                                                  child: const Center(
                                                                      child: Icon(
                                                                    Icons
                                                                        .delete_forever,
                                                                    color: Colors
                                                                        .white,
                                                                  ))),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                            }),
                                          ),
                                        ),
                                      ),
                                      // const SizedBox(
                                      //   width: 3.0,
                                      // ),
                                      SizedBox(
                                        width: 100,
                                        child: GestureDetector(
                                          onTap: () {
                                            _cameraController1
                                                    .isImageSelected.isFalse
                                                ? showModalBottomSheet(
                                                    context: context,
                                                    builder: ((builder) =>
                                                        CustomOpenImage(
                                                          context: context,
                                                          controller:
                                                              _cameraController1,
                                                        )))
                                                : null;
                                          },
                                          child: imagePicker(
                                            Obx(() {
                                              return _cameraController1
                                                          .selectedImagePath
                                                          .value ==
                                                      ''
                                                  ? Icon(
                                                      Icons.add_a_photo,
                                                      color: Colors.grey
                                                          .withOpacity(0.4),
                                                    )
                                                  : Stack(
                                                      children: [
                                                        SizedBox(
                                                          height: 150,
                                                          width: 100,
                                                          child: Image.file(
                                                            File(_cameraController1
                                                                .selectedImagePath
                                                                .value),
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 0,
                                                          child: Container(
                                                            width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    4 +
                                                                4,
                                                            height: 20,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors.red,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          3),
                                                            ),
                                                            child: Center(
                                                              child: MaterialButton(
                                                                  onPressed: () {
                                                                    Get.defaultDialog(
                                                                        title: "Action Required",
                                                                        middleText: "Are you sure to delete this Image?",
                                                                        onCancel: () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        confirmTextColor: Colors.white,
                                                                        onConfirm: () {
                                                                          _cameraController1
                                                                              .selectedImagePath
                                                                              .value = '';
                                                                          _cameraController1
                                                                              .isImageSelected
                                                                              .value = false;
                                                                          Navigator.pop(
                                                                              context);
                                                                        });
                                                                  },
                                                                  child: const Center(
                                                                      child: Icon(
                                                                    Icons
                                                                        .delete_forever,
                                                                    color: Colors
                                                                        .white,
                                                                  ))),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                            }),
                                          ),
                                        ),
                                      ),
                                      // const SizedBox(
                                      //   width: 3.0,
                                      // ),
                                      SizedBox(
                                        width: 100,
                                        child: GestureDetector(
                                          onTap: () {
                                            _cameraController2
                                                    .isImageSelected.isFalse
                                                ? showModalBottomSheet(
                                                    context: context,
                                                    builder: ((builder) =>
                                                        CustomOpenImage(
                                                          context: context,
                                                          controller:
                                                              _cameraController2,
                                                        )))
                                                : null;
                                          },
                                          child: imagePicker(
                                            Obx(() {
                                              return _cameraController2
                                                          .selectedImagePath
                                                          .value ==
                                                      ''
                                                  ? Icon(
                                                      Icons.add_a_photo,
                                                      color: Colors.grey
                                                          .withOpacity(0.4),
                                                    )
                                                  : Stack(
                                                      children: [
                                                        SizedBox(
                                                          height: 150,
                                                          width: 100,
                                                          child: Image.file(
                                                            File(_cameraController2
                                                                .selectedImagePath
                                                                .value),
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 0,
                                                          child: Container(
                                                            width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    4 +
                                                                4,
                                                            height: 20,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors.red,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          3),
                                                            ),
                                                            child: Center(
                                                              child: MaterialButton(
                                                                  onPressed: () {
                                                                    Get.defaultDialog(
                                                                        title: "Action Required",
                                                                        middleText: "Are you sure to delete this Image?",
                                                                        onCancel: () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        confirmTextColor: Colors.white,
                                                                        onConfirm: () {
                                                                          _cameraController2
                                                                              .selectedImagePath
                                                                              .value = '';
                                                                          _cameraController2
                                                                              .isImageSelected
                                                                              .value = false;
                                                                          Navigator.pop(
                                                                              context);
                                                                        });
                                                                  },
                                                                  child: const Center(
                                                                      child: Icon(
                                                                    Icons
                                                                        .delete_forever,
                                                                    color: Colors
                                                                        .white,
                                                                  ))),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                            }),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                CustomButton(
                                  text: "Submit",
                                  action: () {
                                    // dbHelper.dropDB();
                                    // imagedbHelper.dropDB();
                                    var validate =
                                        _formKey.currentState!.validate();
                                    if (validate) {
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => const FeedbackList());
          },
          child: const Icon(Icons.list_alt_outlined),
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
