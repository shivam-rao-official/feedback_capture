import 'package:feedback_capture/models/company.dart';
import 'package:get/state_manager.dart';

class CompanyController extends GetxController {
  late List<Company> companyTypes = [];

  getCompanies() {
    companyTypes = [
      Company(
        "ITC",
      ),
      Company(
        "Direct Competitor",
      ),
      Company(
        "Other Players",
      ),
    ];
  }
}
