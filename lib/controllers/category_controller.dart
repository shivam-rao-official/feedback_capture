import 'package:feedback_capture/models/category.dart';
import 'package:get/state_manager.dart';

class CategoryController extends GetxController {
  late List<Category> categoryTypes = [];

  getCategories() {
    categoryTypes = [
      Category(
        "Atta",
      ),
      Category(
        "Biscuits",
      ),
      Category(
        "Convectionary",
      ),
      Category(
        "Personal Soap",
      ),
    ];
  }
}
