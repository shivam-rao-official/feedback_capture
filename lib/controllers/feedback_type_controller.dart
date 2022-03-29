import 'package:feedback_capture/models/feedback_type.dart';
import 'package:get/state_manager.dart';

class FeedbackTypeController extends GetxController {
  late List<FeedbackType> feedbackTypes = [];

  getFeedbackTypes() {
    feedbackTypes = [
      FeedbackType(
        "Observation",
      ),
      FeedbackType(
        "For Action",
      ),
    ];
  }
}
