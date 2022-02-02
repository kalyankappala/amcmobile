
import 'package:amcmobile/pages/navigation/sldc/sldc_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class SldcBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SldcController());
  }

}