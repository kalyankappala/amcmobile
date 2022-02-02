
import 'package:amcmobile/pages/navigation/service/apiservice.dart';
import 'package:amcmobile/splash/splash_controller.dart';
import 'package:get/get.dart';


class Splash_Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => ApiService());
  }
}