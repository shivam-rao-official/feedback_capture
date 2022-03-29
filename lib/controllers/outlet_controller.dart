import 'package:feedback_capture/models/outlet.dart';
import 'package:get/state_manager.dart';

class OutletController extends GetxController {
  late List<Outlet> outlets = [];

  getOutlets() {
    outlets = [
      Outlet(
        "out001",
        "Outlet-1",
      ),
      Outlet(
        "out002",
        "Outlet-2",
      ),
      Outlet(
        "out003",
        "Outlet-3",
      ),
      Outlet(
        "out004",
        "Outlet-4",
      ),
      Outlet(
        "out005",
        "Outlet-5",
      ),
      Outlet(
        "out006",
        "Outlet-6",
      ),
      Outlet(
        "out007",
        "Outlet-7",
      ),
      Outlet(
        "out008",
        "Outlet-8",
      ),
      Outlet(
        "out009",
        "Outlet-9",
      ),
      Outlet(
        "out0010",
        "Outlet-10",
      ),
      Outlet(
        "others",
        "Others",
      ),
    ];
  }
}
