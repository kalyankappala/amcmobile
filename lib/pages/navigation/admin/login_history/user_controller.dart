import 'dart:convert';
import 'dart:developer';

import 'package:amcmobile/pages/navigation/service/apiservice.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class UsersController extends GetxController {
  ApiService apiservice = Get.find();

  var loginhistory = [].obs;
  var timestamp=0.obs;


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getData();
  }

  @override
  void onClose() {

    super.onClose();
  }




  getData() {
    apiservice.getAlllogins().then((response){
   // apiService.getAllUsers().then((response) {
      print(response);
      print("data");
      loginhistory.value = response.data['loginhistory'];
      print(loginhistory.value);
      timestamp.value=response.data['timestamp'];
      print(timestamp);

      // refreshController.refreshCompleted();
    });
  }
  forceLogout(String name){
    Get.back();
    if(apiservice.getUsername() !=name){


    }}
  }

