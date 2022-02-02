/*
import 'dart:convert';

import 'package:amcmobile/pages/navigation/service/apiservice.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class ManageUsersController extends GetxController{

  final ApiService apiService=Get.find<ApiService>();
  final RefreshController refreshController=RefreshController(initialRefresh: false,);

  // final String title='Mobile';
  var users=[].obs;
  var timestamp=0.obs;




  @override
  void onInit() {
    super.onInit();
  } // String currentRoute=Get.rootDelegate.currentConfiguration!.location!+"/";


  @override
  void onReady() {
    print("Opened "+this.runtimeType.toString());
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  clearUsers(){
    users.value=[];

  }






  getData() {
       apiService.getAllUsers().then((response) {
      print(response);
      print("data");
      users.value = response.data['users'];
      print(users.value);
      // refreshController.refreshCompleted();
    });
  }

}*/
