import 'package:amcmobile/pages/navigation/service/apiservice.dart';
import 'package:amcmobile/pages/navigation/widget/appbar_widgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
 final ApiService apiService=Get.find<ApiService>();
 final userName=TextEditingController();
 final password=TextEditingController();

 var usernameErrorText=''.obs;
 var passwordErrorText=''.obs;


var users=[].obs;



 @override
 void onInit(){
   super.onInit();
 }



@override
  void onReady() {
  print("Opened "+this.runtimeType.toString());
  getAllusers();
  }

 @override
 void onClose() {
   // usernameController.dispose();
   // passwordController.dispose();
   super.onClose();
 }
 bool validateUsername(String value) {
   if (value.isEmpty) {
     usernameErrorText.value='Username required';
     return false;
   }
   return true;
 }

 bool validatePassword(String value) {
   if (value.isEmpty) {
     passwordErrorText.value= 'Password required';
     return false;
   }
   return true;
 }

  void getAllusers(){
   apiService.getAllUsers().then((response){
  print(response);
  users.value=response.data['users'];
 }).onError((error, stackTrace) {
   Get.back();
   DioError dioError=error as DioError;
   String? message;
   if(dioError.response!=null) {
     message = dioError.response!.data['error_description'];
     /*if (err == 'invalid_grant') {
            message = 'Invalid Username/Password';
          } else if (err == 'unauthorized') {
            message = 'Unauthorized';
          }else{
            message=dioError.response!.data;
          }*/
   }else{
     message=dioError.error.toString();
   }
   showSnackBar("Failed", '$message ,Try again');
 });
  }
}
















/* var username=''.obs;
 var password=''.obs;
 var usernameErrorText=''.obs;
 var passwordErrorText=''.obs;
 var errorText=''.obs;

 onChangeUsername(String val){
   username.value=val;
 }

 onChangePassword(String val){
   password.value=val;
 }

 @override
  void onInit(){
   username.value='srikanth';
   password.value='srikanth123';
   super.onInit();
 }
 @override
 void onReady() {
   print("Opened "+this.runtimeType.toString());
 }

 @override
 void onClose() {
   super.onClose();
 }
 bool validateUsername(String value) {
  if (value.isEmpty) {
   usernameErrorText.value='Username required';
   return false;
  }
  return true;
 }

 bool validatePassword(String value) {
  if (value.isEmpty) {
   passwordErrorText.value= 'Password required';
   return false;
  }
  return true;
 }

 void processLogin() {
  usernameErrorText.value = '';
  passwordErrorText.value = '';
  errorText.value = '';
  if (validateUsername(username.value) && validatePassword(password.value)) {

  }
 }*/
