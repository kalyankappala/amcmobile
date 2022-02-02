
import 'package:amcmobile/pages/navigation/realtime/realtime_controller.dart';
import 'package:amcmobile/pages/navigation/service/amctheme_service.dart';
import 'package:amcmobile/pages/navigation/widget/stationDropdown/stationcontroller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class RealTimeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RealTimeController ());
    Get.lazyPut(() => AmcThemeService());
    Get.lazyPut(() => StationDropdown());
  }
}