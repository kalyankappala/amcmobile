import 'package:amcmobile/pages/screens/login_page.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  @override
  void onReady(){
    super.onReady();
    Future.delayed(Duration(seconds: 5),(){
      Get.to(LoginPage(),);
    });
  }
}