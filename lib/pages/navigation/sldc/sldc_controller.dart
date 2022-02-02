
import 'package:amcmobile/pages/navigation/service/apiservice.dart';
import 'package:amcmobile/pages/navigation/service/timer_service.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SldcController extends GetxController {
  final String title = 'SLDC';
  final ApiService apiService=Get.find<ApiService>();

  ApiService apiservice = Get.find();
  /*var timesatmp=0.obs;
  var timestamp2=''.obs;*/
  @override
  void onReady() {
   apiservice.getOauthToken();
   print("kkk");
  }

}