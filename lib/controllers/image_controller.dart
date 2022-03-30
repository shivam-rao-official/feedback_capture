// ignore_for_file: deprecated_member_use
import 'package:feedback_capture/views/dialogs/toast_msg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  var selectedImagePath = ''.obs;

  void getImage(ImageSource imgSrc) async {
    final pickedFile = await ImagePicker().getImage(source: imgSrc);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      // selectedImageSize.value =
      //     ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
      //             .toStringAsFixed(2) +
      //         "MB";

    } else {
      // Get.snackbar("Error", "No Image is selected",
      //     snackPosition: SnackPosition.BOTTOM);
      ToastMsg().warningToast("No Image is selected");
    }
  }
}
