import 'package:feedback_capture/models/sub_category.dart';
import 'package:get/state_manager.dart';

class SubCategoryController extends GetxController {
  late List<SubCategory> subCategoryTypes = [];

  getSubCategories() {
    subCategoryTypes = [
      SubCategory(
        "Atta",
        [
          "Aashirvaad Whole Wheat Atta",
          "Aashirvaad Sugar Release Control Atta",
          "Aashirvaad Atta with Multigrains",
          "Aashirvaad Select Atta",
          "Aashirvaad Fortified Atta",
        ],
      ),
      SubCategory(
        "Biscuits",
        [
          "Sunfeast Dark Fantasy Desserts",
          "Sunfeast All Rounder",
          "Sunfeast Bounce Choco Creme",
          "Sunfeast Bounce Orange Creme",
          "Sunfeast Bounce Elaichi Creme",
          "Sunfeast Veda Marie Light",
        ],
      ),
      SubCategory(
        "Convectionary",
        [
          "Insignia",
          "India Kings",
          "Classic",
          "Gold Flake",
          "American Club",
          "Wills Navy Cut",
          "Players",
          "Scissors",
          "Capstan",
          "Berkeley",
          "Bristol",
          "Flake",
          "Silk Cut",
          "Duke & Royal",
        ],
      ),
      SubCategory(
        "Personal Soap",
        [
          "Fiama",
          "Vivel",
          "Savlon",
        ],
      ),
    ];
  }
}
