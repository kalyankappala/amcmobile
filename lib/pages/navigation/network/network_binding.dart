
import 'package:amcmobile/pages/navigation/network/network_controller.dart';
import 'package:amcmobile/pages/navigation/service/apiservice.dart';
import 'package:amcmobile/pages/navigation/service/timer_service.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class NetworkBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => NetworkController());
  }
}