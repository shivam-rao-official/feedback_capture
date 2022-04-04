// ignore_for_file: library_prefixes

import 'dart:convert';
import 'dart:io' as Io;

// ignore_for_file: deprecated_member_use
import 'package:feedback_capture/views/dialogs/toast_msg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  var selectedImagePath = ''.obs;
  var toBase64String = ''.obs;
  RxBool isImageSelected = false.obs;
  RxBool isConverted = false.obs;

  void getImage(ImageSource imgSrc) async {
    final pickedFile = await ImagePicker().getImage(source: imgSrc);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      isImageSelected = RxBool(true);
      // base64String(selectedImagePath);
      // log("1");
      // isConverted.value = true;
      // log("2");
    } else {
      ToastMsg().warningToast("No Image is selected");
    }
  }

  void base64String(RxString selectedImagePath) {
    final byte = Io.File(selectedImagePath.value).readAsBytesSync();
    String img64 = base64.encode(byte);
    toBase64String.value = img64;
  }
}
