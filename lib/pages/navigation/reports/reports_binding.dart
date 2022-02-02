
import 'package:amcmobile/pages/navigation/reports/reports_controller.dart';
import 'package:amcmobile/pages/navigation/service/apiservice.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class ReportsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ReportsController());
  }

}